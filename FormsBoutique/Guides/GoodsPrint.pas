unit GoodsPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Datasnap.DBClient, cxPropertiesStore, dxBar,
  Vcl.ActnList, DataModul, ParentForm, dsdDB, dsdAction, dsdAddOn, dxBarExtItems,
  cxGridBandedTableView, cxGridDBBandedTableView, cxCheckBox, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxContainer, dsdGuides, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel,
  cxCurrencyEdit, Vcl.ExtCtrls;

type
  TGoodsPrintForm = class(TParentForm)
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    DataSource: TDataSource;
    MasterCDS: TClientDataSet;
    cxPropertiesStore: TcxPropertiesStore;
    dxBarManager: TdxBarManager;
    dxBarManagerBar1: TdxBar;
    ActionList: TActionList;
    bbRefresh: TdxBarButton;
    actRefresh: TdsdDataSetRefresh;
    bbInsert: TdxBarButton;
    spSelect: TdsdStoredProc;
    bbEdit: TdxBarButton;
    dsdSetErased: TdsdUpdateErased;
    dsdSetUnErased: TdsdUpdateErased;
    bbSetErased: TdxBarButton;
    bbSetUnErased: TdxBarButton;
    dsdGridToExcel: TdsdGridToExcel;
    bbToExcel: TdxBarButton;
    dxBarStatic: TdxBarStatic;
    spErased: TdsdStoredProc;
    bbChoice: TdxBarButton;
    cxGridDBTableView: TcxGridDBTableView;
    GoodsName: TcxGridDBColumn;
    dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn;
    dsdChoiceGuides: TdsdChoiceGuides;
    dsdDBViewAddOn: TdsdDBViewAddOn;
    ProtocolOpenForm: TdsdOpenForm;
    bbProtocolOpenForm: TdxBarButton;
    actShowAll: TBooleanStoredProcAction;
    bbShowAll: TdxBarButton;
    GoodsGroupName: TcxGridDBColumn;
    MeasureName: TcxGridDBColumn;
    CompositionName: TcxGridDBColumn;
    GoodsInfoName: TcxGridDBColumn;
    LineFabricaName: TcxGridDBColumn;
    LabelName: TcxGridDBColumn;
    GroupNameFull: TcxGridDBColumn;
    GoodsSizeName: TcxGridDBColumn;
    InvNumber: TcxGridDBColumn;
    CurrencyName: TcxGridDBColumn;
    BrandName: TcxGridDBColumn;
    PeriodName: TcxGridDBColumn;
    PeriodYear: TcxGridDBColumn;
    FabrikaName: TcxGridDBColumn;
    CompositionGroupName: TcxGridDBColumn;
    GuidesUnit: TdsdGuides;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    FormParams: TdsdFormParams;
    RefreshDispatcher: TRefreshDispatcher;
    spUnErased: TdsdStoredProc;
    InvNumber_full: TcxGridDBColumn;
    Id: TcxGridDBColumn;
    GoodsCode: TcxGridDBColumn;
    GuidesUser: TdsdGuides;
    Panel: TPanel;
    cxLabel1: TcxLabel;
    edUser: TcxButtonEdit;
    cxLabel6: TcxLabel;
    edUnit: TcxButtonEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TGoodsPrintForm);

end.
