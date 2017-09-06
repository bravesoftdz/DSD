unit OrderInternal;

interface

uses
  DataModul, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AncestorDocument, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, dsdAddOn,
  dsdGuides, dsdDB, Vcl.Menus, dxBarExtItems, dxBar, cxClasses,
  Datasnap.DBClient, dsdAction, Vcl.ActnList, cxPropertiesStore, cxButtonEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit, Vcl.ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxPC, cxCurrencyEdit, cxCheckBox, frxClass, frxDBSet,
  dxSkinsCore, dxSkinsDefaultPainters, cxSplitter, dxBarBuiltInMenu, cxNavigator,
  cxCalc, dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TOrderInternalForm = class(TAncestorDocumentForm)
    edUnit: TcxButtonEdit;
    cxLabel4: TcxLabel;
    GuidesUnit: TdsdGuides;
    GoodsCode: TcxGridDBColumn;
    GoodsName: TcxGridDBColumn;
    Amount: TcxGridDBColumn;
    actGoodsKindChoice: TOpenChoiceForm;
    spSelectPrint: TdsdStoredProc;
    N3: TMenuItem;
    RefreshDispatcher: TRefreshDispatcher;
    actRefreshPrice: TdsdDataSetRefresh;
    PrintHeaderCDS: TClientDataSet;
    bbPrintTax: TdxBarButton;
    PrintItemsCDS: TClientDataSet;
    bbTax: TdxBarButton;
    bbPrintTax_Client: TdxBarButton;
    bbPrint_Bill: TdxBarButton;
    PrintItemsSverkaCDS: TClientDataSet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    colPrice: TcxGridDBColumn;
    colJuridicalName: TcxGridDBColumn;
    colGoodsName: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    ChildDS: TDataSource;
    ChildCDS: TClientDataSet;
    coCode: TcxGridDBColumn;
    DBViewChildAddOn: TdsdDBViewAddOn;
    colContractName: TcxGridDBColumn;
    colDeferment: TcxGridDBColumn;
    colPercent: TcxGridDBColumn;
    colSuperFinalPrice: TcxGridDBColumn;
    colBonus: TcxGridDBColumn;
    PartnerGoodsName: TcxGridDBColumn;
    Price: TcxGridDBColumn;
    ContractName: TcxGridDBColumn;
    spUpdatePrioritetPartner: TdsdStoredProc;
    actUpdatePrioritetPartner: TdsdExecStoredProc;
    bbPrioritetPartner: TdxBarButton;
    colMakerName: TcxGridDBColumn;
    actSetLinkGoodsForm: TdsdOpenForm;
    bbSetGoodsLink: TdxBarButton;
    PartnerGoodsCode: TcxGridDBColumn;
    MakerName: TcxGridDBColumn;
    spDelete_Object_LinkGoodsByGoods: TdsdStoredProc;
    mactDeleteLink: TMultiAction;
    actDeleteLink: TdsdExecStoredProc;
    bbDeleteLink: TdxBarButton;
    colPartionGoodsDate: TcxGridDBColumn;
    colPartionGoodsDateColor: TcxGridDBColumn;
    PartionGoodsDate: TcxGridDBColumn;
    PartionGoodsDateColor: TcxGridDBColumn;
    MinimumLot: TcxGridDBColumn;
    colMinimumLot: TcxGridDBColumn;
    Multiplicity: TcxGridDBColumn;
    mactDeleteLinkGroup: TMultiAction;
    mactDeleteLinkDS: TMultiAction;
    N2: TMenuItem;
    cxLabel3: TcxLabel;
    edOrderKind: TcxButtonEdit;
    GuidesOrderKind: TdsdGuides;
    colRemains: TcxGridDBColumn;
    Comment: TcxGridDBColumn;
    isTopColor: TcxGridDBColumn;
    RemainsInUnit: TcxGridDBColumn;
    MCS: TcxGridDBColumn;
    NDSKindName: TcxGridDBColumn;
    AmountAll: TcxGridDBColumn;
    CalcAmountAll: TcxGridDBColumn;
    SummAll: TcxGridDBColumn;
    Income_Amount: TcxGridDBColumn;
    isCalculated: TcxGridDBColumn;
    CheckAmount: TcxGridDBColumn;
    isOneJuridical: TcxGridDBColumn;
    actShowMessage: TShowMessageAction;
    isPromo: TcxGridDBColumn;
    OperDatePromo: TcxGridDBColumn;
    InvNumberPromo: TcxGridDBColumn;
    actMovementItemProtocolChild: TdsdOpenForm;
    bbMovementItemProtocolChild: TdxBarButton;
    edIsDocument: TcxCheckBox;
    SendAmount: TcxGridDBColumn;
    InsertRecord: TInsertRecord;
    actGoodsChoiceForm: TOpenChoiceForm;
    bb: TdxBarButton;
    AmountDeferred: TcxGridDBColumn;
    isPriceDiff: TcxGridDBColumn;
    OrderShedule_Color: TcxGridDBColumn;
    Fond_Color: TcxGridDBColumn;
    isLast_2days: TcxGridDBColumn;
    isRepeat: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TOrderInternalForm);

end.
