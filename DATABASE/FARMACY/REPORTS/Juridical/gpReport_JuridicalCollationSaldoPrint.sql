-- Function: gpReport_JuridicalCollationSaldoPrint()

DROP FUNCTION IF EXISTS gpReport_JuridicalCollationSaldoPrint (TDateTime, Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_JuridicalCollationSaldoPrint(
    IN inStartDate           TDateTime  ,
    IN inJuridical_BasisId   Integer  ,
    IN inJuridical_BasisName TVarChar,
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS SETOF refcursor
AS
$BODY$
    DECLARE vbUserId Integer;
    DECLARE vbCount1 Integer;

    DECLARE Cursor1 refcursor;
    DECLARE Cursor2 refcursor;
BEGIN
    -- �������� ���� ������������ �� ����� ���������
    -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Select_Movement_Sale());
    vbUserId:= inSession;

    OPEN Cursor1 FOR
      SELECT '��� ������. ������� �� ����: '||to_char(DATE_TRUNC ('DAY', inStartDate), 'DD.MM.YYYY') as Title, 1 AS ID
      UNION ALL
      SELECT '����������� ���� (����): '||inJuridical_BasisName, 2;
    RETURN NEXT Cursor1;

    -- �������
    CREATE TEMP TABLE _tmpResult (Title TVarChar, Debet TVarChar, Kredit TVarChar, Summa TVarChar) ON COMMIT DROP;

      -- ������������� � ������������

      WITH tmpContainer AS (SELECT CLO_JuridicalBasis.ContainerId
                                 , Container.Amount
                            FROM ContainerLinkObject AS CLO_JuridicalBasis

                                 INNER JOIN Container ON Container.Id = CLO_JuridicalBasis.ContainerId
                                                     AND Container.DescId = zc_Container_Summ()

                            WHERE CLO_JuridicalBasis.ObjectId = inJuridical_BasisId
                              AND CLO_JuridicalBasis.DescId = zc_ContainerLinkObject_JuridicalBasis())

         , tmpContainerSumm AS (SELECT tmpContainer.ContainerId
                                     , tmpContainer.Amount - COALESCE (SUM (MIContainer.Amount), 0) AS Amount
                                   FROM tmpContainer
                                        LEFT JOIN MovementItemContainer AS MIContainer
                                                                        ON MIContainer.Containerid = tmpContainer.ContainerId
                                                                       AND MIContainer.OperDate >= date_trunc('day', inStartDate)
                                   GROUP BY tmpContainer.ContainerId, tmpContainer.Amount)




      INSERT INTO _tmpResult
      SELECT Object_Juridical.ValueData                                           AS Name,
             CASE WHEN Sum(Container.Amount) > 0 THEN Sum(Container.Amount) END   AS Debet,
             CASE WHEN Sum(Container.Amount) < 0 THEN - Sum(Container.Amount) END AS Kredit,
             Null
      FROM tmpContainerSumm AS Container

           INNER JOIN ContainerLinkObject AS CLO_Juridical
                                         ON CLO_Juridical.ContainerId = Container.ContainerId
                                        AND CLO_Juridical.DescId = zc_ContainerLinkObject_Juridical()

           LEFT JOIN Object as Object_Juridical ON Object_Juridical.ID = CLO_Juridical.ObjectId


      GROUP BY CLO_Juridical.ObjectId, Object_Juridical.ValueData
      HAVING Sum(Container.Amount) <> 0
      ORDER BY Object_Juridical.ValueData;

      vbCount1 := (SELECT Count(*) FROM _tmpResult);
      INSERT INTO _tmpResult VALUES ('�����:', '=SUM(R[-1]C:R[-'||vbCount1::TVarChar||']C)', '=SUM(R[-1]C:R[-'||vbCount1::TVarChar||']C)', Null);

      -- ������� ������

      INSERT INTO _tmpResult VALUES (NULL, NULL, NULL, NULL);
      INSERT INTO _tmpResult VALUES (NULL, NULL, NULL, NULL);
      INSERT INTO _tmpResult VALUES ('������� ������ �� ���� ���', '��� ���', '���', '� ���');

      WITH tmpContainer AS (SELECT Container.ID AS ContainerId
                                 , Container.ObjectId
                                 , Container.Amount
                            FROM Container

                                 INNER JOIN ObjectLink AS ObjectLink_Unit_Juridical
                                                       ON ObjectLink_Unit_Juridical.DescId = zc_ObjectLink_Unit_Juridical()
                                                      AND ObjectLink_Unit_Juridical.ObjectId = Container.WhereObjectId

                            WHERE ObjectLink_Unit_Juridical.ChildObjectId = inJuridical_BasisId
                              AND Container.DescId = zc_Container_Count())

         , tmpContainerSumm AS (SELECT tmpContainer.ContainerId
                                     , tmpContainer.Amount - COALESCE (SUM (MIContainer.Amount), 0) AS Amount
                                   FROM tmpContainer
                                        LEFT JOIN MovementItemContainer AS MIContainer
                                                                        ON MIContainer.Containerid = tmpContainer.ContainerId
                                                                       AND MIContainer.OperDate >= date_trunc('day', inStartDate)
                                   GROUP BY tmpContainer.ContainerId, tmpContainer.Amount)


      INSERT INTO _tmpResult
      SELECT
              Object_NDSKind.ValueData                                                            AS NDSKindName
            , Sum(Round(COALESCE (MIFloat_PriceWithOutVAT.ValueData, 0) * Container.Amount, 2))   AS SummaWith
            , Sum(Round(COALESCE (MIFloat_JuridicalPrice.ValueData, 0) * Container.Amount, 2) -
              Round(COALESCE (MIFloat_PriceWithOutVAT.ValueData, 0) * Container.Amount, 2))       AS SummaNDS
            , Sum(Round(COALESCE (MIFloat_JuridicalPrice.ValueData, 0) * Container.Amount, 2))    AS Summa


      FROM tmpContainerSumm AS Container

        -- ������
       LEFT OUTER JOIN ContainerLinkObject AS CLI_MI
                                           ON CLI_MI.ContainerId = Container.ContainerId
                                          AND CLI_MI.DescId = zc_ContainerLinkObject_PartionMovementItem()
       LEFT OUTER JOIN Object AS Object_PartionMovementItem ON Object_PartionMovementItem.Id = CLI_MI.ObjectId
        -- ������� �������
       LEFT OUTER JOIN MovementItem AS MI_Income
                                    ON MI_Income.Id = Object_PartionMovementItem.ObjectCode

        -- ���� ��� ������, ������� ���� ������� ��������������� - � ���� �������� ����� "���������" ��������� ������ �� ����������
       LEFT JOIN MovementItemFloat AS MIFloat_MovementItem
                                   ON MIFloat_MovementItem.MovementItemId = MI_Income.Id
                                  AND MIFloat_MovementItem.DescId = zc_MIFloat_MovementItemId()
         -- �������� ������� �� ���������� (���� ��� ������, ������� ���� ������� ���������������)
       LEFT JOIN MovementItem AS MI_Income_find ON MI_Income_find.Id = (MIFloat_MovementItem.ValueData :: Integer)

         -- ���� � ������ ���, ��� �������� ������� �� ���������� (��� NULL)
       LEFT JOIN MovementItemFloat AS MIFloat_JuridicalPrice
                                   ON MIFloat_JuridicalPrice.MovementItemId = COALESCE (MI_Income_find.Id, MI_Income.Id)
                                  AND MIFloat_JuridicalPrice.DescId = zc_MIFloat_JuridicalPrice()

         -- ���� ��� ����� ���, ��� �������� ������� �� ���������� (��� NULL)
       LEFT JOIN MovementItemFloat AS MIFloat_PriceWithOutVAT
                                   ON MIFloat_PriceWithOutVAT.MovementItemId = COALESCE (MI_Income_find.Id, MI_Income.Id)
                                  AND MIFloat_PriceWithOutVAT.DescId = zc_MIFloat_PriceWithOutVAT()


         -- ���, ��� �������� ������� �� ���������� (��� NULL)
       LEFT JOIN MovementLinkObject AS MovementLinkObject_NDSKind
                                    ON MovementLinkObject_NDSKind.MovementId = COALESCE (MI_Income_find.MovementId, MI_Income.MovementId)
                                   AND MovementLinkObject_NDSKind.DescId = zc_MovementLinkObject_NDSKind()

       LEFT JOIN Object AS Object_NDSKind ON Object_NDSKind.Id = MovementLinkObject_NDSKind.ObjectId

       GROUP BY Object_NDSKind.ValueData ;

      vbCount1 := (SELECT Count(*) FROM _tmpResult) - vbCount1 - 4;
      INSERT INTO _tmpResult VALUES ('�����:', '=SUM(R[-1]C:R[-'||vbCount1::TVarChar||']C)', '=SUM(R[-1]C:R[-'||vbCount1::TVarChar||']C)', '=SUM(R[-1]C:R[-'||vbCount1::TVarChar||']C)');

    OPEN Cursor2 FOR SELECT * FROM _tmpResult;
    RETURN NEXT Cursor2;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpReport_JuridicalCollationSaldoPrint (TDateTime, Integer, TVarChar, TVarChar) OWNER TO postgres;

/*
 ������� ����������: ����, �����
               ������ �.�.
 23.01.19        *
*/

-- SELECT * FROM gpReport_JuridicalCollationSaldoPrint ('01.01.2019'::TDateTime, 7433753, '���_�����-�', '3');