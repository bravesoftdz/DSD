-- Function: gpSelect_MovementItem_ListDiff()


DROP FUNCTION IF EXISTS gpSelect_MovementItem_ListDiff (Integer, Boolean, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_MovementItem_ListDiff(
    IN inMovementId  Integer      , -- ключ Документа
    IN inShowAll     Boolean      , --
    IN inIsErased    Boolean      , --
    IN inSession     TVarChar       -- сессия пользователя
)
RETURNS TABLE (Id Integer
             , GoodsId Integer, GoodsCode Integer, GoodsName TVarChar
             , JuridicalId Integer, JuridicalName TVarChar
             , ContractId Integer, ContractName TVarChar
             , Amount TFloat
             , Price TFloat
             , Summa TFloat
             , Comment    TVarChar
             , InsertName TVarChar, UpdateName TVarChar
             , InsertDate TDateTime, UpdateDate TDateTime
             , isErased Boolean
             )
AS
$BODY$
  DECLARE vbUserId Integer;
  DECLARE vbObjectId Integer;
  DECLARE vbUnitId Integer;
BEGIN

    -- проверка прав пользователя на вызов процедуры
    -- vbUserId := PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_MovementItem_Income());
    vbUserId := inSession;
    vbObjectId := lpGet_DefaultValue('zc_Object_Retail', vbUserId);

    SELECT MovementLinkObject_Unit.ObjectId AS UnitId
    INTO vbUnitId
    FROM MovementLinkObject AS MovementLinkObject_Unit
    WHERE MovementLinkObject_Unit.MovementId = inMovementId
      AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit();

    IF inShowAll
    THEN
        RETURN QUERY
        WITH
        tmpIsErased AS (SELECT FALSE AS isErased
                      UNION ALL
                        SELECT inIsErased AS isErased WHERE inIsErased = TRUE
                       )
      , tmpGoods AS (SELECT Object_Goods.Id               AS GoodsId
                          , Object_Goods.GoodsCodeInt     AS GoodsCode
                          , Object_Goods.GoodsName        AS GoodsName
                          , Object_Goods.ObjectId         AS ObjectId
                     FROM Object_Goods_View AS Object_Goods
                     WHERE Object_Goods.isErased = FALSE
                       AND Object_Goods.ObjectId = vbObjectId
                     )

      , tmpPrice AS (SELECT Price_Goods.ChildObjectId               AS GoodsId
                          , ROUND(Price_Value.ValueData,2) ::TFloat AS Price
                     FROM ObjectLink AS ObjectLink_Price_Unit
                          LEFT JOIN ObjectFloat AS Price_Value
                                                ON Price_Value.ObjectId = ObjectLink_Price_Unit.ObjectId
                                               AND Price_Value.DescId = zc_ObjectFloat_Price_Value()
                          LEFT JOIN ObjectLink AS Price_Goods
                                               ON Price_Goods.ObjectId = ObjectLink_Price_Unit.ObjectId
                                              AND Price_Goods.DescId = zc_ObjectLink_Price_Goods()
                      WHERE ObjectLink_Price_Unit.DescId = zc_ObjectLink_Price_Unit()
                        AND ObjectLink_Price_Unit.ChildObjectId = vbUnitId
                     )

      , tmpMI AS   (SELECT MovementItem.ObjectId                   AS GoodsId
                         , MovementItem.Amount                     AS Amount
                         , MovementItem.Id                         AS Id
                         , MovementItem.isErased                   AS isErased
                    FROM tmpIsErased
                       JOIN MovementItem ON MovementItem.MovementId = inMovementId
                                        AND MovementItem.DescId     = zc_MI_Master()
                                        AND MovementItem.isErased   = tmpIsErased.isErased
                    )

            SELECT
                0                          AS Id
              , tmpGoods.GoodsId           AS GoodsId
              , tmpGoods.GoodsCode         AS GoodsCode
              , tmpGoods.GoodsName         AS GoodsName
              
              , 0                          AS JuridicalId
              , NULL::TVarChar             AS JuridicalName
              , 0                          AS ContractId
              , NULL::TVarChar             AS ContractName
             
              , NULL ::TFloat              AS Amount
              , tmpPrice.Price             AS Price
              , NULL ::TFloat              AS Summa
             
              , NULL::TVarChar             AS Comment
              , NULL::TVarChar             AS InsertName
              , NULL::TVarChar             AS UpdateName
              , NULL::TDateTime            AS InsertDate
              , NULL::TDateTime            AS UpdateDate
              
              , FALSE                      AS isErased

            FROM tmpGoods
                LEFT JOIN tmpMI ON tmpMI.GoodsId = tmpGoods.GoodsId
                LEFT JOIN tmpPrice ON tmpPrice.GoodsId = tmpGoods.GoodsId
            WHERE tmpMI.GoodsId IS NULL
         UNION ALL
            SELECT
                MovementItem.Id                         AS Id
              , MovementItem.GoodsId                    AS GoodsId
              , Object_Goods.ObjectCode                 AS GoodsCode
              , Object_Goods.ValueData                  AS GoodsName

              , Object_Juridical.Id         ::Integer   AS JuridicalId
              , Object_Juridical.ValueData  ::TVarChar  AS JuridicalName
              , Object_Contract.Id          ::Integer   AS ContractId
              , Object_Contract.ValueData   ::TVarChar  AS ContractName
             
              , MovementItem.Amount                     AS Amount
              , MIFloat_Price.ValueData                 AS Price
              , (MovementItem.Amount * MIFloat_Price.ValueData) ::TFloat AS Summa

              , MIString_Comment.ValueData              AS Comment
              , Object_Insert.ValueData                 AS InsertName
              , Object_Update.ValueData                 AS UpdateName
              , MIDate_Insert.ValueData                 AS InsertDate
              , MIDate_Update.ValueData                 AS UpdateDate

              , MovementItem.isErased                   AS isErased
            FROM tmpMI AS MovementItem
                 LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = MovementItem.GoodsId
                 LEFT JOIN MovementItemFloat AS MIFloat_Price
                                             ON MIFloat_Price.MovementItemId = MovementItem.Id
                                            AND MIFloat_Price.DescId = zc_MIFloat_Price()

                 LEFT OUTER JOIN MovementItemString AS MIString_Comment
                                                    ON MIString_Comment.MovementItemId = MovementItem.Id
                                                   AND MIString_Comment.DescId = zc_MIString_Comment()
                 LEFT JOIN MovementItemLinkObject AS MILO_Juridical
                                                  ON MILO_Juridical.MovementItemId = MovementItem.Id
                                                 AND MILO_Juridical.DescId = zc_MILinkObject_Juridical()
                 LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = MILO_Juridical.ObjectId 

                 LEFT JOIN MovementItemLinkObject AS MILO_Contract
                                                  ON MILO_Contract.MovementItemId = MovementItem.Id
                                                 AND MILO_Contract.DescId = zc_MILinkObject_Contract()
                 LEFT JOIN Object AS Object_Contract ON Object_Contract.Id = MILO_Contract.ObjectId 

                 LEFT JOIN MovementItemDate AS MIDate_Insert
                                            ON MIDate_Insert.MovementItemId = MovementItem.Id
                                           AND MIDate_Insert.DescId = zc_MIDate_Insert()
                 LEFT JOIN MovementItemDate AS MIDate_Update
                                            ON MIDate_Update.MovementItemId = MovementItem.Id
                                           AND MIDate_Update.DescId = zc_MIDate_Update()

                 LEFT JOIN MovementItemLinkObject AS MILO_Insert
                                                  ON MILO_Insert.MovementItemId = MovementItem.Id
                                                 AND MILO_Insert.DescId = zc_MILinkObject_Insert()
                 LEFT JOIN Object AS Object_Insert ON Object_Insert.Id = MILO_Insert.ObjectId
                 LEFT JOIN MovementItemLinkObject AS MILO_Update
                                                  ON MILO_Update.MovementItemId = MovementItem.Id
                                                 AND MILO_Update.DescId = zc_MILinkObject_Update()
                 LEFT JOIN Object AS Object_Update ON Object_Update.Id = MILO_Update.ObjectId
            ;
    ELSE
       RETURN QUERY
       WITH
       tmpIsErased AS (SELECT FALSE AS isErased
                        UNION ALL
                       SELECT inIsErased AS isErased WHERE inIsErased = TRUE
                      )

            SELECT MovementItem.Id                         AS Id
                 , MovementItem.ObjectId                   AS GoodsId
                 , Object_Goods.ObjectCode                 AS GoodsCode
                 , Object_Goods.ValueData                  AS GoodsName
                 , Object_Juridical.Id         ::Integer   AS JuridicalId
                 , Object_Juridical.ValueData  ::TVarChar  AS JuridicalName
                 , Object_Contract.Id          ::Integer   AS ContractId
                 , Object_Contract.ValueData   ::TVarChar  AS ContractName
                 , MovementItem.Amount         ::TFloat    AS Amount
                 , (MovementItem.Amount * MIFloat_Price.ValueData) ::TFloat AS Summa
                 , MIFloat_Price.ValueData     ::TFloat    AS Price
                 , MIString_Comment.ValueData  ::TVarChar  AS Comment
                 , Object_Insert.ValueData                 AS InsertName
                 , Object_Update.ValueData                 AS UpdateName
                 , MIDate_Insert.ValueData                 AS InsertDate
                 , MIDate_Update.ValueData                 AS UpdateDate

                 , MovementItem.isErased                   AS isErased
            FROM tmpIsErased
               JOIN MovementItem ON MovementItem.MovementId = inMovementId
                                AND MovementItem.DescId     = zc_MI_Master()
                                AND MovementItem.isErased   = tmpIsErased.isErased
               LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = MovementItem.ObjectId
               LEFT JOIN MovementItemFloat AS MIFloat_Price
                                           ON MIFloat_Price.MovementItemId = MovementItem.Id
                                          AND MIFloat_Price.DescId = zc_MIFloat_Price()

               LEFT OUTER JOIN MovementItemString AS MIString_Comment
                                                  ON MIString_Comment.MovementItemId = MovementItem.Id
                                                 AND MIString_Comment.DescId = zc_MIString_Comment()
               LEFT JOIN MovementItemLinkObject AS MILO_Juridical
                                                ON MILO_Juridical.MovementItemId = MovementItem.Id
                                               AND MILO_Juridical.DescId = zc_MILinkObject_Juridical()
               LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = MILO_Juridical.ObjectId 

               LEFT JOIN MovementItemLinkObject AS MILO_Contract
                                                ON MILO_Contract.MovementItemId = MovementItem.Id
                                               AND MILO_Contract.DescId = zc_MILinkObject_Contract()
               LEFT JOIN Object AS Object_Contract ON Object_Contract.Id = MILO_Contract.ObjectId 

               LEFT JOIN MovementItemDate AS MIDate_Insert
                                          ON MIDate_Insert.MovementItemId = MovementItem.Id
                                         AND MIDate_Insert.DescId = zc_MIDate_Insert()
               LEFT JOIN MovementItemDate AS MIDate_Update
                                          ON MIDate_Update.MovementItemId = MovementItem.Id
                                         AND MIDate_Update.DescId = zc_MIDate_Update()

               LEFT JOIN MovementItemLinkObject AS MILO_Insert
                                                ON MILO_Insert.MovementItemId = MovementItem.Id
                                               AND MILO_Insert.DescId = zc_MILinkObject_Insert()
               LEFT JOIN Object AS Object_Insert ON Object_Insert.Id = MILO_Insert.ObjectId
               LEFT JOIN MovementItemLinkObject AS MILO_Update
                                                ON MILO_Update.MovementItemId = MovementItem.Id
                                               AND MILO_Update.DescId = zc_MILinkObject_Update()
               LEFT JOIN Object AS Object_Update ON Object_Update.Id = MILO_Update.ObjectId
               ;
    END IF;
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И.
 15.09.18         * 
*/

-- тест
-- SELECT * FROM gpSelect_MovementItem_ListDiff (inMovementId:= 1084910, inShowAll:= TRUE, inIsErased:= FALSE, inSession:= '9818')
-- SELECT * FROM gpSelect_MovementItem_ListDiff (inMovementId:= 1084910, inShowAll:= FALSE, inIsErased:= FALSE, inSession:= '2')
