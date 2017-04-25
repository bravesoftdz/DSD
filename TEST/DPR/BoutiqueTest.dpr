program BoutiqueTest;

uses
  Forms,
  DUnitTestRunner,
  SysUtils,
  dbCreateStructureTest in '..\SOURCEBoutique\STRUCTURE\dbCreateStructureTest.pas',
  dbMetadataTest in '..\SOURCEBoutique\METADATA\dbMetadataTest.pas',
  zLibUtil in '..\SOURCEBoutique\zLibUtil.pas',
  CommonFunctionTest in '..\SOURCEBoutique\Function\CommonFunctionTest.pas',
  dbBoutiqueProcedureTest in '..\SOURCEBoutique\dbBoutiqueProcedureTest.pas',
  UtilConst in '..\SOURCEBoutique\UtilConst.pas',
  dbEnumTest in '..\SOURCEBoutique\dbEnumTest.pas',
  ProcessTest in '..\SOURCEBoutique\Process\ProcessTest.pas',
  dbCreateViewTest in '..\SOURCEBoutique\View\dbCreateViewTest.pas',
  DefaultsTest in '..\SOURCEBoutique\Defaults\DefaultsTest.pas',
  LoadBoutiqueFormTest in '..\SOURCEBoutique\LoadBoutiqueFormTest.pas',
  PriceListGoodsItem in '..\..\Forms\Guides\PriceListGoodsItem.pas' {PriceListGoodsItemForm},
  CommonData in '..\..\SOURCE\CommonData.pas',
  Authentication in '..\..\SOURCE\Authentication.pas',
  FormStorage in '..\..\SOURCE\FormStorage.pas',
  ParentForm in '..\..\SOURCE\ParentForm.pas' {ParentForm},
  Storage in '..\..\SOURCE\Storage.pas',
  UtilConvert in '..\..\SOURCE\UtilConvert.pas',
  dsdAction in '..\..\SOURCE\COMPONENT\dsdAction.pas',
  dsdAddOn in '..\..\SOURCE\COMPONENT\dsdAddOn.pas',
  dsdDB in '..\..\SOURCE\COMPONENT\dsdDB.pas',
  dsdGuides in '..\..\SOURCE\COMPONENT\dsdGuides.pas',
  DataModul in '..\..\SOURCE\DataModul.pas' {dmMain: TDataModule},
  dbTest in '..\SOURCEBoutique\dbTest.pas',
  ChoicePeriod in '..\..\SOURCE\COMPONENT\ChoicePeriod.pas' {PeriodChoiceForm},
  Defaults in '..\..\SOURCE\COMPONENT\Defaults.pas',
  UnilWin in '..\..\SOURCE\UnilWin.pas',
  MessagesUnit in '..\..\SOURCE\MessagesUnit.pas' {MessagesForm},
  SimpleGauge in '..\..\SOURCE\SimpleGauge.pas' {SimpleGaugeForm},
  ClientBankLoad in '..\..\SOURCE\COMPONENT\ClientBankLoad.pas',
  Document in '..\..\SOURCE\COMPONENT\Document.pas',
  ExternalLoad in '..\..\SOURCE\COMPONENT\ExternalLoad.pas',
  Log in '..\..\SOURCE\Log.pas',
  ExternalData in '..\..\SOURCE\COMPONENT\ExternalData.pas',
  ExternalSave in '..\..\SOURCE\COMPONENT\ExternalSave.pas',
  VKDBFDataSet in '..\..\SOURCE\DBF\VKDBFDataSet.pas',
  VKDBFPrx in '..\..\SOURCE\DBF\VKDBFPrx.pas',
  VKDBFUtil in '..\..\SOURCE\DBF\VKDBFUtil.pas',
  VKDBFMemMgr in '..\..\SOURCE\DBF\VKDBFMemMgr.pas',
  VKDBFCrypt in '..\..\SOURCE\DBF\VKDBFCrypt.pas',
  VKDBFGostCrypt in '..\..\SOURCE\DBF\VKDBFGostCrypt.pas',
  VKDBFCDX in '..\..\SOURCE\DBF\VKDBFCDX.pas',
  VKDBFIndex in '..\..\SOURCE\DBF\VKDBFIndex.pas',
  VKDBFSorters in '..\..\SOURCE\DBF\VKDBFSorters.pas',
  VKDBFCollate in '..\..\SOURCE\DBF\VKDBFCollate.pas',
  VKDBFParser in '..\..\SOURCE\DBF\VKDBFParser.pas',
  VKDBFNTX in '..\..\SOURCE\DBF\VKDBFNTX.pas',
  VKDBFSortedList in '..\..\SOURCE\DBF\VKDBFSortedList.pas',
  ObjectTest in '..\SOURCEBoutique\Objects\ObjectTest.pas',
  cxGridAddOn in '..\..\SOURCE\DevAddOn\cxGridAddOn.pas',
  MeDOC in '..\..\SOURCE\MeDOC\MeDOC.pas',
  MeDocXML in '..\..\SOURCE\MeDOC\MeDocXML.pas',
  Measure in '..\..\FormsBoutique\Guides\Measure.pas' {MeasureForm: TParentForm},
  MeasureEdit in '..\..\FormsBoutique\Guides\MeasureEdit.pas' {MeasureEditForm: TParentForm},
  CompositionGroup in '..\..\FormsBoutique\Guides\CompositionGroup.pas' {CompositionGroupForm: TParentForm},
  CompositionGroupEdit in '..\..\FormsBoutique\Guides\CompositionGroupEdit.pas' {CompositionGroupEditForm: TParentForm},
  Composition in '..\..\FormsBoutique\Guides\Composition.pas' {CompositionForm: TParentForm},
  CompositionEdit in '..\..\FormsBoutique\Guides\CompositionEdit.pas' {CompositionEditForm: TParentForm},
  CountryBrand in '..\..\FormsBoutique\Guides\CountryBrand.pas' {CountryBrandForm: TParentForm},
  CountryBrandEdit in '..\..\FormsBoutique\Guides\CountryBrandEdit.pas' {CountryBrandEditForm: TParentForm},
  Brand in '..\..\FormsBoutique\Guides\Brand.pas' {BrandForm: TParentForm},
  BrandEdit in '..\..\FormsBoutique\Guides\BrandEdit.pas' {BrandEditForm: TParentForm},
  Fabrika in '..\..\FormsBoutique\Guides\Fabrika.pas' {FabrikaForm: TParentForm},
  FabrikaEdit in '..\..\FormsBoutique\Guides\FabrikaEdit.pas' {FabrikaEditForm: TParentForm},
  LineFabrica in '..\..\FormsBoutique\Guides\LineFabrica.pas' {LineFabricaForm: TParentForm},
  LineFabricaEdit in '..\..\FormsBoutique\Guides\LineFabricaEdit.pas' {LineFabricaEditForm: TParentForm},
  GoodsInfo in '..\..\FormsBoutique\Guides\GoodsInfo.pas' {GoodsInfoForm: TParentForm},
  GoodsInfoEdit in '..\..\FormsBoutique\Guides\GoodsInfoEdit.pas' {GoodsInfoEditForm: TParentForm},
  GoodsSize in '..\..\FormsBoutique\Guides\GoodsSize.pas' {GoodsSizeForm: TParentForm},
  GoodsSizeEdit in '..\..\FormsBoutique\Guides\GoodsSizeEdit.pas' {GoodsSizeEditForm: TParentForm},
  GoodsGroup in '..\..\FormsBoutique\Guides\GoodsGroup.pas' {GoodsGroupForm: TParentForm},
  GoodsGroupEdit in '..\..\FormsBoutique\Guides\GoodsGroupEdit.pas' {GoodsGroupEditForm: TParentForm},
  GoodsGroup_Object in '..\..\FormsBoutique\Guides\GoodsGroup_Object.pas' {GoodsGroup_ObjectForm: TParentForm},
  Kassa in '..\..\FormsBoutique\Guides\Kassa.pas' {KassaForm: TParentForm},
  KassaEdit in '..\..\FormsBoutique\Guides\KassaEdit.pas' {KassaEditForm: TParentForm},
  Currency in '..\..\FormsBoutique\Guides\Currency.pas' {CurrencyForm: TParentForm},
  CurrencyEdit in '..\..\FormsBoutique\Guides\CurrencyEdit.pas' {CurrencyEditForm: TParentForm},
  Member in '..\..\FormsBoutique\Guides\Member.pas' {MemberForm: TParentForm},
  MemberEdit in '..\..\FormsBoutique\Guides\MemberEdit.pas' {MemberEditForm: TParentForm},
  Period in '..\..\FormsBoutique\Guides\Period.pas' {PeriodForm: TParentForm},
  PeriodEdit in '..\..\FormsBoutique\Guides\PeriodEdit.pas' {PeriodEditForm: TParentForm},
  Discount in '..\..\FormsBoutique\Guides\Discount.pas' {DiscountForm: TParentForm},
  DiscountEdit in '..\..\FormsBoutique\Guides\DiscountEdit.pas' {DiscountEditForm: TParentForm},
  DiscountTools in '..\..\FormsBoutique\Guides\DiscountTools.pas' {DiscountToolsForm: TParentForm},
  DiscountToolsEdit in '..\..\FormsBoutique\Guides\DiscountToolsEdit.pas' {DiscountToolsEditForm: TParentForm},
  Partner in '..\..\FormsBoutique\Guides\Partner.pas' {PartnerForm: TParentForm},
  PartnerEdit in '..\..\FormsBoutique\Guides\PartnerEdit.pas' {PartnerEditForm: TParentForm},
  JuridicalGroup in '..\..\FormsBoutique\Guides\JuridicalGroup.pas' {JuridicalGroupForm: TParentForm},
  JuridicalGroupEdit in '..\..\FormsBoutique\Guides\JuridicalGroupEdit.pas' {JuridicalGroupEditForm: TParentForm},
  JuridicalGroup_Object in '..\..\FormsBoutique\Guides\JuridicalGroup_Object.pas' {JuridicalGroup_ObjectForm: TParentForm},
  Juridical in '..\..\FormsBoutique\Guides\Juridical.pas' {JuridicalForm: TParentForm},
  JuridicalEdit in '..\..\FormsBoutique\Guides\JuridicalEdit.pas' {JuridicalEditForm: TParentForm},
  JuridicalBasis in '..\..\FormsBoutique\Guides\JuridicalBasis.pas' {JuridicalBasis: TParentForm},
  Units in '..\..\FormsBoutique\Guides\Units.pas' {UnitsForm: TParentForm},
  UnitEdit in '..\..\FormsBoutique\Guides\UnitEdit.pas' {UnitsEditForm: TParentForm},
  City in '..\..\FormsBoutique\Guides\City.pas' {CityForm: TParentForm},
  CityEdit in '..\..\FormsBoutique\Guides\CityEdit.pas' {CityEditForm: TParentForm},
  Client in '..\..\FormsBoutique\Guides\Client.pas' {ClientForm: TParentForm},
  ClientEdit in '..\..\FormsBoutique\Guides\ClientEdit.pas' {ClientEditForm: TParentForm},
  Labels in '..\..\FormsBoutique\Guides\Labels.pas' {LabelForm: TParentForm},
  LabelEdit in '..\..\FormsBoutique\Guides\LabelEdit.pas' {LabelEditForm: TParentForm},
  Goods in '..\..\FormsBoutique\Guides\Goods.pas' {GoodsForm: TParentForm},
  GoodsEdit in '..\..\FormsBoutique\Guides\GoodsEdit.pas' {GoodsEditForm: TParentForm},
  GoodsTree in '..\..\FormsBoutique\Guides\GoodsTree.pas' {GoodsTreeForm: TParentForm},
  DiscountKind in '..\..\FormsBoutique\Guides\DiscountKind.pas' {DiscountKindForm: TParentForm},
  GoodsItem in '..\..\FormsBoutique\Guides\GoodsItem.pas' {GoodsItemForm: TParentForm},
  GoodsItemEdit in '..\..\FormsBoutique\Guides\GoodsItemEdit.pas' {GoodsItemEditForm: TParentForm},
  PartionGoods in '..\..\FormsBoutique\Guides\PartionGoods.pas' {PartionGoodsForm: TParentForm},
  Position in '..\..\FormsBoutique\Guides\Position.pas' {PositionForm: TParentForm},
  PositionEdit in '..\..\FormsBoutique\Guides\PositionEdit.pas' {PositionEditForm: TParentForm},
  Personal in '..\..\FormsBoutique\Guides\Personal.pas' {PersonalForm: TParentForm},
  PersonalEdit in '..\..\FormsBoutique\Guides\PersonalEdit.pas' {PersonalEditForm: TParentForm},
  ImportExportLinkType in '..\..\Forms\Kind\ImportExportLinkType.pas' {ImportExportLinkTypeForm: TParentForm},
  AncestorBase in '..\..\Forms\Ancestor\AncestorBase.pas' {AncestorBaseForm: TParentForm},
  AncestorData in '..\..\Forms\Ancestor\AncestorData.pas' {AncestorDataForm: TParentForm},
  AncestorDBGrid in '..\..\Forms\Ancestor\AncestorDBGrid.pas' {AncestorDBGridForm: TParentForm},
  AncestorDialog in '..\..\Forms\Ancestor\AncestorDialog.pas' {AncestorDialogForm: TParentForm},
  AncestorDocument in '..\..\Forms\Ancestor\AncestorDocument.pas' {AncestorDocumentForm: TParentForm},
  AncestorDocumentMC in '..\..\Forms\Ancestor\AncestorDocumentMC.pas' {AncestorDocumentMCForm: TParentForm},
  AncestorEditDialog in '..\..\Forms\Ancestor\AncestorEditDialog.pas' {AncestorEditDialogForm: TParentForm},
  AncestorEnum in '..\..\Forms\Ancestor\AncestorEnum.pas' {AncestorEnumForm: TParentForm},
  AncestorGuides in '..\..\Forms\Ancestor\AncestorGuides.pas' {AncestorGuidesForm: TParentForm},
  AncestorJournal in '..\..\Forms\Ancestor\AncestorJournal.pas' {AncestorJournalForm: TParentForm},
  AboutBoxUnit in '..\..\SOURCE\AboutBoxUnit.pas' {AboutBox},
  UpdaterTest in '..\SOURCEBoutique\Component\UpdaterTest.pas',
  dbObjectTest in '..\SOURCEBoutique\dbObjectTest.pas',
  MainForm in '..\..\FormsBoutique\MainForm.pas' {MainForm},
  User in '..\..\FormsBoutique\Guides\User.pas' {UserForm: TParentForm},
  UserEdit in '..\..\FormsBoutique\Guides\UserEdit.pas' {UserEditForm: TParentForm},
  RoleTest in '..\SOURCEBoutique\Objects\All\RoleTest.pas',
  UserTest in '..\SOURCEBoutique\Objects\All\UserTest.pas',
  ParentFormTest in '..\SOURCEBoutique\Form\ParentFormTest.pas' {TestForm: TParentForm},
  Objects in '..\..\FormsBoutique\Guides\Objects.pas' {ObjectForm: TParentForm},
  ObjectDesc in '..\..\FormsBoutique\Guides\ObjectDesc.pas' {ObjectDescForm: TParentForm},
  ActionTest in '..\SOURCEBoutique\Objects\All\ActionTest.pas',
  AncestorMain in '..\..\Forms\Ancestor\AncestorMain.pas' {AncestorMainForm},
  Protocol in '..\..\FormsBoutique\Guides\Protocol.pas' {ProtocolForm: TParentForm},
  Account in '..\..\FormsBoutique\Guides\Account.pas' {AccountForm: TParentForm},
  Account_Object in '..\..\FormsBoutique\Guides\Account_Object.pas' {Account_ObjectForm: TParentForm},
  AccountDirection in '..\..\FormsBoutique\Guides\AccountDirection.pas' {AccountDirectionForm: TParentForm},
  AccountDirection_Object in '..\..\FormsBoutique\Guides\AccountDirection_Object.pas' {AccountDirection_ObjectForm: TParentForm},
  AccountDirectionEdit in '..\..\FormsBoutique\Guides\AccountDirectionEdit.pas' {AccountDirectionEditForm: TParentForm},
  AccountEdit in '..\..\FormsBoutique\Guides\AccountEdit.pas' {AccountEditForm: TParentForm},
  AccountGroup in '..\..\FormsBoutique\Guides\AccountGroup.pas' {AccountGroupForm: TParentForm},
  AccountGroup_Object in '..\..\FormsBoutique\Guides\AccountGroup_Object.pas' {AccountGroup_ObjectForm: TParentForm},
  AccountGroupEdit in '..\..\FormsBoutique\Guides\AccountGroupEdit.pas' {AccountGroupEditForm: TParentForm},
  AccountDirectionTest in '..\SOURCEBoutique\Objects\All\AccountDirectionTest.pas',
  AccountGroupTest in '..\SOURCEBoutique\Objects\All\AccountGroupTest.pas',
  AccountTest in '..\SOURCEBoutique\Objects\All\AccountTest.pas',
  AncestorReport in '..\..\Forms\Ancestor\AncestorReport.pas' {AncestorReportForm: TParentForm},
  Vcl.Dialogs,
  dsdDataSetDataLink in '..\..\SOURCE\COMPONENT\dsdDataSetDataLink.pas',
  dsdException in '..\..\SOURCE\dsdException.pas',
  EDI in '..\..\SOURCE\EDI\EDI.pas',
  ComDocXML in '..\..\SOURCE\EDI\ComDocXML.pas',
  OrderXML in '..\..\SOURCE\EDI\OrderXML.pas',
  DeclarXML in '..\..\SOURCE\EDI\DeclarXML.pas',
  DesadvXML in '..\..\SOURCE\EDI\DesadvXML.pas',
  InvoiceXML in '..\..\SOURCE\EDI\InvoiceXML.pas',
  OrdrspXML in '..\..\SOURCE\EDI\OrdrspXML.pas',
  RecadvXML in '..\..\SOURCE\EDI\RecadvXML.pas',
  StatusXML in '..\..\SOURCE\EDI\StatusXML.pas',
  dsdInternetAction in '..\..\SOURCE\COMPONENT\dsdInternetAction.pas',
  LookAndFillSettings in '..\..\SOURCE\LookAndFillSettings.pas' {LookAndFillSettingsForm},
  dsdXMLTransform in '..\..\SOURCE\COMPONENT\dsdXMLTransform.pas',
  IncomeJournal in '..\..\FormsBoutique\Document\IncomeJournal.pas' {IncomeJournalForm: TParentForm},
  Income in '..\..\FormsBoutique\Document\Income.pas' {IncomeForm: TParentForm},
  Movement_PeriodDialog in '..\..\FormsBoutique\Document\Movement_PeriodDialog.pas' {Movement_PeriodDialogForm: TParentForm},
  IncomeItemEdit in '..\..\FormsBoutique\Document\IncomeItemEdit.pas' {IncomeItemEditForm: TParentForm},
  ReturnOutJournal in '..\..\FormsBoutique\Document\ReturnOutJournal.pas' {ReturnOutJournalForm: TParentForm},
  ReturnOut in '..\..\FormsBoutique\Document\ReturnOut.pas' {ReturnOutForm: TParentForm},
  SendJournal in '..\..\FormsBoutique\Document\SendJournal.pas' {SendJournalForm: TParentForm},
  Send in '..\..\FormsBoutique\Document\Send.pas' {SendForm: TParentForm},
  LoadBoutiqueReportTest in '..\SOURCEBoutique\LoadBoutiqueReportTest.pas',
  PartionGoodsChoice in '..\..\FormsBoutique\Guides\PartionGoodsChoice.pas' {PartionGoodsChoiceForm: TParentForm},
  LossJournal in '..\..\FormsBoutique\Document\LossJournal.pas' {LossJournalForm: TParentForm},
  Loss in '..\..\FormsBoutique\Document\Loss.pas' {LossForm: TParentForm};

{$R *.res}
{$R DevExpressRus.res}

begin
  ConnectionPath := '..\INIT\Boutique_init.php';
  EnumPath := '..\DATABASE\Boutique\METADATA\Enum\';
  CreateStructurePath := '..\DATABASE\Boutique\STRUCTURE\';
  LocalViewPath := '..\DATABASE\Boutique\View\';
  LocalProcedurePath := '..\DATABASE\Boutique\PROCEDURE\';
  LocalProcessPath := '..\DATABASE\COMMONBoutique\Boutique\PROCESS\';

  dsdProject := prBoutique;

  if FindCmdLineSwitch('realboutique', true)
  then gc_AdminPassword := '�����1234'
  else gc_AdminPassword := '�����';

  gc_ProgramName := 'Boutique.exe';

  Application.Initialize;
  gc_isSetDefault := true;
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;

  DUnitTestRunner.RunRegisteredTests;
end.
