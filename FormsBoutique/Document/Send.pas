unit Send;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ParentForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, dsdDB, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Datasnap.DBClient, Vcl.ActnList, dsdAction,
  cxPropertiesStore, dxBar, Vcl.ExtCtrls, cxContainer, cxLabel, cxTextEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dsdGuides, Vcl.Menus, cxPCdxBarPopupMenu, cxPC, frxClass, frxDBSet,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  DataModul, dxBarExtItems, dsdAddOn, cxCheckBox, cxCurrencyEdit,
  cxImageComboBox;

type
  TSendForm = class(TParentForm)
    FormParams: TdsdFormParams;
    spSelectMI: TdsdStoredProc;
    dxBarManager: TdxBarManager;
    dxBarManagerBar: TdxBar;
    bbRefresh: TdxBarButton;
    cxPropertiesStore: TcxPropertiesStore;
    ActionList: TActionList;
    actRefresh: TdsdDataSetRefresh;
    MasterDS: TDataSource;
    MasterCDS: TClientDataSet;
    GuidesFrom: TdsdGuides;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    cxPageControl: TcxPageControl;
    cxTabSheetMain: TcxTabSheet;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    Code: TcxGridDBColumn;
    GoodsName: TcxGridDBColumn;
    Amount: TcxGridDBColumn;
    OperPrice: TcxGridDBColumn;
    TotalSumm: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    actUpdateMasterDS: TdsdUpdateDataSet;
    spInsertUpdateMIMaster: TdsdStoredProc;
    actPrint: TdsdPrintAction;
    bbPrint: TdxBarButton;
    CountForPrice: TcxGridDBColumn;
    bbShowAll: TdxBarButton;
    bbStatic: TdxBarStatic;
    actShowAll: TBooleanStoredProcAction;
    MasterViewAddOn: TdsdDBViewAddOn;
    UserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn;
    spInsertUpdateMovement: TdsdStoredProc;
    HeaderSaver: THeaderSaver;
    spGet: TdsdStoredProc;
    RefreshAddOn: TRefreshAddOn;
    actGridToExcel: TdsdGridToExcel;
    bbGridToExcel: TdxBarButton;
    GuidesFiller: TGuidesFiller;
    actInsertUpdateMovement: TdsdExecStoredProc;
    bbInsertUpdateMovement: TdxBarButton;
    actSetErased: TdsdUpdateErased;
    actSetUnErased: TdsdUpdateErased;
    actShowErased: TBooleanStoredProcAction;
    bbErased: TdxBarButton;
    bbUnErased: TdxBarButton;
    bbShowErased: TdxBarButton;
    spErasedMIMaster: TdsdStoredProc;
    spUnErasedMIMaster: TdsdStoredProc;
    IsErased: TcxGridDBColumn;
    StatusGuides: TdsdGuides;
    spChangeStatus: TdsdStoredProc;
    actUnCompleteMovement: TChangeGuidesStatus;
    actCompleteMovement: TChangeGuidesStatus;
    actDeleteMovement: TChangeGuidesStatus;
    MeasureName: TcxGridDBColumn;
    GuidesTo: TdsdGuides;
    spGetTotalSumm: TdsdStoredProc;
    actMIContainer: TdsdOpenForm;
    bbMIContainer: TdxBarButton;
    actMIProtocol: TdsdOpenForm;
    bbMIProtocol: TdxBarButton;
    GoodsGroupNameFull: TcxGridDBColumn;
    PrintHeaderCDS: TClientDataSet;
    PrintItemsCDS: TClientDataSet;
    spSelectPrint: TdsdStoredProc;
    bbInsertRecord: TdxBarButton;
    actRefreshMI: TdsdDataSetRefresh;
    PartionId: TcxGridDBColumn;
    DataPanel: TPanel;
    edInvNumber: TcxTextEdit;
    cxLabel1: TcxLabel;
    edOperDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    edTo: TcxButtonEdit;
    edFrrom: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel11: TcxLabel;
    ceStatus: TcxButtonEdit;
    actInsertRecord: TInsertRecord;
    actPartionGoodsChoice: TOpenChoiceForm;
    cxLabel16: TcxLabel;
    ceComment: TcxTextEdit;
    TotalSummBalance: TcxGridDBColumn;
    actReport_Goods: TdsdOpenForm;
    bbOpenReportForm: TdxBarButton;
    actReport_Goods_to: TdsdOpenForm;
    bbOpenReportTo: TdxBarButton;
    bbPrintIn: TdxBarButton;
    actPrintIn: TdsdPrintAction;
    spInsertUpdate_MI_Send_Amount: TdsdStoredProc;
    actUpdateAmount: TdsdExecStoredProc;
    macUpdateAmountSingl: TMultiAction;
    macUpdateAmount: TMultiAction;
    bbUpdateAmount: TdxBarButton;
    spUpdatePersent: TdsdExecStoredProc;
    macUpdatePersent: TMultiAction;
    macUpdateAll: TMultiAction;
    ExecuteDialogDiscount: TExecuteDialog;
    spInsertUpdate_Discount: TdsdStoredProc;
    bbUpdateAll: TdxBarButton;
    DiscountTax_From: TcxGridDBColumn;
    DiscountTax_To: TcxGridDBColumn;
    cxLabel9: TcxLabel;
    edGoodsPrint: TcxButtonEdit;
    GuidesGoodsPrint: TdsdGuides;
    spSelectPrintStickerList: TdsdStoredProc;
    spDelete_Object_GoodsPrint: TdsdStoredProc;
    spGet_User_curr: TdsdStoredProc;
    spInsertUpdate_GoodsPrint: TdsdStoredProc;
    spUpdate_FloatValue_DS: TdsdStoredProc;
    actPrintStickerList: TdsdPrintAction;
    actDeleteGoodsPrintList: TdsdExecStoredProc;
    actUpdate_FloatValue_DS: TdsdExecStoredProc;
    actInsertUpdate_GoodsPrint: TdsdExecStoredProc;
    macAddGoodsPrintList_Rem: TMultiAction;
    mactGoodsPrintList_Print: TMultiAction;
    bbGoodsPrintList_Print: TdxBarButton;
  private
  public
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TSendForm);

end.
