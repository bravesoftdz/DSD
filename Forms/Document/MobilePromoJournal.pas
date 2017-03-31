unit MobilePromoJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorJournal, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxImageComboBox,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsdxBarPainter, dsdDB,
  dsdAddOn, ChoicePeriod, Vcl.Menus, dxBarExtItems, dxBar, cxClasses,
  Datasnap.DBClient, dsdAction, Vcl.ActnList, cxPropertiesStore, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxPC, cxCurrencyEdit, cxCheckBox, dsdGuides, cxButtonEdit;

type
  TMobilePromoJournalForm = class(TAncestorJournalForm)
    colPromoKindName: TcxGridDBColumn;
    colPriceListName: TcxGridDBColumn;
    colStartSale: TcxGridDBColumn;
    colEndSale: TcxGridDBColumn;
    colUnitName: TcxGridDBColumn;
    colPersonalTradeName: TcxGridDBColumn;
    colPersonalName: TcxGridDBColumn;
    dxBarButton1: TdxBarButton;
    spSelect_Movement_Promo_Print: TdsdStoredProc;
    PrintHead: TClientDataSet;
    actPrint: TdsdPrintAction;
    colPartnerName: TcxGridDBColumn;
    colPartnerDescName: TcxGridDBColumn;
    colContractName: TcxGridDBColumn;
    colContractTagName: TcxGridDBColumn;
    colCommentMain: TcxGridDBColumn;
    spUpdate_Movement_Promo_Data: TdsdStoredProc;
    dxBarButton2: TdxBarButton;
    N13: TMenuItem;
    N14: TMenuItem;
    colChangePercentName: TcxGridDBColumn;
    ExecuteDialog: TExecuteDialog;
    EndReturn: TcxGridDBColumn;
    cxLabel27: TcxLabel;
    edJuridicalBasis: TcxButtonEdit;
    JuridicalBasisGuides: TdsdGuides;
    spGet_UserJuridicalBasis: TdsdStoredProc;
    actRefreshStart: TdsdDataSetRefresh;
    cxLabel3: TcxLabel;
    edPersonalTrade: TcxButtonEdit;
    PersonalTradeGuides: TdsdGuides;
    spGet_PersonalTrade: TdsdStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TMobilePromoJournalForm);

end.