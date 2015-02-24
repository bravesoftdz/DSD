unit Receipt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, DataModul, ParentForm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxImageComboBox, cxButtonEdit, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  dsdAddOn, ChoicePeriod, dsdDB, dsdAction, System.Classes, Vcl.ActnList,
  dxBarExtItems, dxBar, cxClasses, cxPropertiesStore, Datasnap.DBClient,
  cxCheckBox, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, Vcl.Controls, cxGrid, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, cxSplitter, cxCurrencyEdit;

type
  TReceiptForm = class(TParentForm)
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    clValue: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    cxPropertiesStore: TcxPropertiesStore;
    dxBarManager: TdxBarManager;
    dxBarManagerBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbInsert: TdxBarButton;
    bbEdit: TdxBarButton;
    bbSetErased: TdxBarButton;
    bbSetUnErased: TdxBarButton;
    bbGridToExcel: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    bbChoiceGuides: TdxBarButton;
    ActionList: TActionList;
    actRefresh: TdsdDataSetRefresh;
    actInsert: TdsdInsertUpdateAction;
    actUpdate: TdsdInsertUpdateAction;
    dsdSetErased: TdsdUpdateErased;
    dsdSetUnErased: TdsdUpdateErased;
    dsdGridToExcel: TdsdGridToExcel;
    dsdStoredProc: TdsdStoredProc;
    dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn;
    spErasedUnErased: TdsdStoredProc;
    dsdDBViewAddOn: TdsdDBViewAddOn;
    clStartDate: TcxGridDBColumn;
    clEndDate: TcxGridDBColumn;
    clIsMain: TcxGridDBColumn;
    clPartionCount: TcxGridDBColumn;
    dsdChoiceGuides: TdsdChoiceGuides;
    clPartionValue: TcxGridDBColumn;
    clName: TcxGridDBColumn;
    clGoodsCode: TcxGridDBColumn;
    clGoodsName: TcxGridDBColumn;
    clGoodsKindName: TcxGridDBColumn;
    clGoodsKindCompleteName: TcxGridDBColumn;
    clReceiptCostName: TcxGridDBColumn;
    clReceiptKindName: TcxGridDBColumn;
    clIsErased: TcxGridDBColumn;
    cxGridContractCondition: TcxGrid;
    cxGridDBTableViewReceiptChild: TcxGridDBTableView;
    clGoodsKindNameclChild: TcxGridDBColumn;
    clValueChild: TcxGridDBColumn;
    clIsErasedChild: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ReceiptChildDS: TDataSource;
    ReceiptChildCDS: TClientDataSet;
    spInsertUpdateReceiptChild: TdsdStoredProc;
    spSelectReceiptChild: TdsdStoredProc;
    ReceiptChildChoiceForm: TOpenChoiceForm;
    InsertRecordCCK: TInsertRecord;
    bbInsertRecCCK: TdxBarButton;
    actReceiptChild: TdsdUpdateDataSet;
    spInsertUpdate: TdsdStoredProc;
    actUpdateDataSet: TdsdUpdateDataSet;
    clReceiptCode: TcxGridDBColumn;
    ChildViewAddOn: TdsdDBViewAddOn;
    clGoodsNameChild: TcxGridDBColumn;
    Goods_ObjectChoiceForm: TOpenChoiceForm;
    clCommentChild: TcxGridDBColumn;
    clValueCost: TcxGridDBColumn;
    clTaxExit: TcxGridDBColumn;
    bbStartDate: TdxBarControlContainerItem;
    bbEnd: TdxBarControlContainerItem;
    bbEndDate: TdxBarControlContainerItem;
    bbIsEndDate: TdxBarControlContainerItem;
    bbIsPeriod: TdxBarControlContainerItem;
    PeriodChoice: TPeriodChoice;
    RefreshDispatcher: TRefreshDispatcher;
    clStartDateChild: TcxGridDBColumn;
    clEndDateChild: TcxGridDBColumn;
    clCode: TcxGridDBColumn;
    cxBottomSplitter: TcxSplitter;
    clTotalWeightMain: TcxGridDBColumn;
    clTotalWeight: TcxGridDBColumn;
    clGoodsCodeChild: TcxGridDBColumn;
    clWeightPackage: TcxGridDBColumn;
    clMeasureNameChild: TcxGridDBColumn;
    clMeasureName: TcxGridDBColumn;
    clGroupNumber: TcxGridDBColumn;
    actShowAll: TBooleanStoredProcAction;
    bbShowAll: TdxBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TReceiptForm);

end.
