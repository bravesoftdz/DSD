program ProjectTest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  dbCreateStructureTest in '..\SOURCE\STRUCTURE\dbCreateStructureTest.pas',
  dbMetadataTest in '..\SOURCE\Metadata\dbMetadataTest.pas',
  ProcessTest in '..\SOURCE\Process\ProcessTest.pas',
  dbCreateViewTest in '..\SOURCE\View\dbCreateViewTest.pas',
  dbProcedureTest in '..\SOURCE\dbProcedureTest.pas',
  dbEnumTest in '..\SOURCE\dbEnumTest.pas',
  AuthenticationTest in '..\SOURCE\AuthenticationTest.pas',
  CommonObjectProcedureTest in '..\SOURCE\Objects\CommonObjectProcedureTest.pas',
  dbObjectTest in '..\SOURCE\dbObjectTest.pas',
  UnitsTest in '..\SOURCE\Objects\All\UnitsTest.pas',
  CommonMovementProcedureTest in '..\SOURCE\Movement\CommonMovementProcedureTest.pas',
  dbMovementTest in '..\SOURCE\Movement\dbMovementTest.pas',
  LoadFormTest in '..\SOURCE\LoadFormTest.pas',
  Forms,
  CommonContainerProcedureTest in '..\SOURCE\Container\CommonContainerProcedureTest.pas',
  CommonMovementItemProcedureTest in '..\SOURCE\MovementItem\CommonMovementItemProcedureTest.pas',
  CommonMovementItemContainerProcedureTest in '..\SOURCE\MovementItemContainer\CommonMovementItemContainerProcedureTest.pas',
  CommonObjectHistoryProcedureTest in '..\SOURCE\ObjectHistory\CommonObjectHistoryProcedureTest.pas',
  CommonProtocolProcedureTest in '..\SOURCE\Protocol\CommonProtocolProcedureTest.pas',
  CommonFunctionTest in '..\SOURCE\Function\CommonFunctionTest.pas',
  CommonReportsProcedureTest in '..\SOURCE\Reports\CommonReportsProcedureTest.pas',
  DataModul in '..\..\SOURCE\DataModul.pas' {dmMain: TDataModule},
  Authentication in '..\..\SOURCE\Authentication.pas',
  Storage in '..\..\SOURCE\Storage.pas',
  zLibUtil in '..\SOURCE\zLibUtil.pas',
  UtilConst in '..\..\SOURCE\UtilConst.pas',
  UtilConvert in '..\..\SOURCE\UtilConvert.pas',
  CommonData in '..\..\SOURCE\CommonData.pas',
  dsdGuides in '..\..\SOURCE\COMPONENT\dsdGuides.pas',
  FormStorage in '..\..\SOURCE\FormStorage.pas',
  GoodsKindEdit in '..\..\Forms\GoodsKindEdit.pas' {GoodsKindEditForm},
  GoodsPropertyEdit in '..\..\Forms\GoodsPropertyEdit.pas' {GoodsPropertyEditForm},
  GoodsProperty in '..\..\Forms\GoodsProperty.pas' {GoodsPropertyForm},
  CurrencyEdit in '..\..\Forms\CurrencyEdit.pas' {CurencyEditForm},
  GoodsGroupEdit in '..\..\Forms\GoodsGroupEdit.pas' {GoodsGroupEditForm},
  PriceListEdit in '..\..\Forms\PriceListEdit.pas' {PriceListEditForm},
  PriceList in '..\..\Forms\PriceList.pas' {PriceListForm},
  ParentForm in '..\..\SOURCE\ParentForm.pas' {ParentForm},
  dsdAction in '..\..\SOURCE\COMPONENT\dsdAction.pas',
  GoodsKind in '..\..\Forms\GoodsKind.pas' {GoodsKindForm},
  Bank in '..\..\Forms\Bank.pas' {CurrencyForm},
  GoodsGroup in '..\..\Forms\GoodsGroup.pas' {GoodsGroupForm},
  GoodsTree in '..\..\Forms\Guides\GoodsTree.pas' {GoodsTreeForm},
  UnitEdit in '..\..\Forms\Guides\UnitEdit.pas' {UnitEditForm},
  MeasureEdit in '..\..\Forms\MeasureEdit.pas' {MeasureEditForm},
  Status in '..\..\Forms\Status.pas' {StatusForm},
  Partner_Object in '..\..\Forms\Guides\Partner_Object.pas' {Partner_ObjectForm},
  Currency in '..\..\Forms\Currency.pas' {CurrencyForm},
  BankEdit in '..\..\Forms\BankEdit.pas' {BankEditForm},
  PriceListGoodsItem in '..\..\Forms\PriceListGoodsItem.pas' {PriceListGoodsItemForm},
  GoodsPropertyValue in '..\..\Forms\GoodsPropertyValue.pas' {GoodsPropertyValueForm},
  ContractKindEdit in '..\..\Forms\Guides\ContractKindEdit.pas' {ContractKindEditForm},
  ContractKind in '..\..\Forms\Guides\ContractKind.pas' {ContractKindForm},
  GoodsPropertyValueEdit in '..\..\Forms\GoodsPropertyValueEdit.pas' {GoodsPropertyValueEditForm},
  BankAccount in '..\..\Forms\BankAccount.pas' {BankAccountForm},
  BankAccountEdit in '..\..\Forms\BankAccountEdit.pas' {BankAccountEditForm},
  BusinessEdit in '..\..\Forms\BusinessEdit.pas' {BusinessEditForm},
  Business in '..\..\Forms\Business.pas' {BusinessForm},
  Juridical_Object in '..\..\Forms\Guides\Juridical_Object.pas' {Juridical_ObjectForm},
  dsdDB in '..\..\SOURCE\COMPONENT\dsdDB.pas',
  UnitTree in '..\..\Forms\Guides\UnitTree.pas' {UnitTreeForm},
  dbMovementItemTest in '..\SOURCE\dbMovementItemTest.pas',
  Income in '..\..\Forms\Document\Income.pas' {IncomeForm},
  IncomeJournal in '..\..\Forms\Document\IncomeJournal.pas' {ParentForm2},
  dsdAddOn in '..\..\SOURCE\COMPONENT\dsdAddOn.pas',
  dbMovementCompleteTest in '..\SOURCE\dbMovementCompleteTest.pas',
  Report_Balance in '..\..\Forms\Report\Report_Balance.pas' {Report_BalanceForm},
  LoadReportTest in '..\SOURCE\LoadReportTest.pas',
  PriceListItemTest in '..\SOURCE\ObjectHistory\All\PriceListItemTest.pas',
  InfoMoneyGroup in '..\..\Forms\Guides\InfoMoneyGroup.pas' {InfoMoneyGroupForm},
  InfoMoneyGroupEdit in '..\..\Forms\Guides\InfoMoneyGroupEdit.pas' {InfoMoneyGroupEditForm},
  InfoMoneyDestination in '..\..\Forms\Guides\InfoMoneyDestination.pas' {InfoMoneyDestinationForm},
  InfoMoneyDestinationEdit in '..\..\Forms\Guides\InfoMoneyDestinationEdit.pas' {InfoMoneyDestinationEditForm},
  InfoMoney_Object in '..\..\Forms\Guides\InfoMoney_Object.pas' {InfoMoney_ObjectForm},
  InfoMoneyEdit in '..\..\Forms\Guides\InfoMoneyEdit.pas' {InfoMoneyEditForm},
  AccountGroup in '..\..\Forms\Guides\AccountGroup.pas' {AccountGroupForm},
  AccountGroupEdit in '..\..\Forms\Guides\AccountGroupEdit.pas' {AccountGroupEditForm},
  AccountDirection in '..\..\Forms\Guides\AccountDirection.pas' {AccountDirectionForm},
  AccountDirectionEdit in '..\..\Forms\Guides\AccountDirectionEdit.pas' {AccountDirectionEditForm},
  ProfitLossGroup in '..\..\Forms\ProfitLossGroup.pas' {ProfitLossGroupForm},
  ProfitLossGroupEdit in '..\..\Forms\ProfitLossGroupEdit.pas' {ProfitLossGroupEditForm},
  Account_Object in '..\..\Forms\Guides\Account_Object.pas' {Account_ObjectForm},
  AccountEdit in '..\..\Forms\Guides\AccountEdit.pas' {AccountEditForm},
  ProfitLoss in '..\..\Forms\ProfitLoss.pas' {ProfitLossForm},
  ProfitLossDirection in '..\..\Forms\ProfitLossDirection.pas' {ProfitLossDirectionForm},
  ProfitLossDirectionEdit in '..\..\Forms\ProfitLossDirectionEdit.pas' {ProfitLossDirectionEditForm},
  ProfitLossEdit in '..\..\Forms\ProfitLossEdit.pas' {ProfitLossEditForm},
  dbTest in '..\SOURCE\dbTest.pas',
  TradeMark in '..\..\Forms\TradeMark.pas' {TradeMarkForm},
  TradeMarkEdit in '..\..\Forms\TradeMarkEdit.pas' {TradeMarkEditForm},
  Route in '..\..\Forms\Guides\Route.pas' {RouteForm},
  RouteEdit in '..\..\Forms\Guides\RouteEdit.pas' {RouteEditForm},
  RouteSorting in '..\..\Forms\Guides\RouteSorting.pas' {RouteSortingForm},
  RouteSortingEdit in '..\..\Forms\Guides\RouteSortingEdit.pas' {RouteSortingEditForm},
  Member in '..\..\Forms\Member.pas' {MemberForm},
  MemberEdit in '..\..\Forms\MemberEdit.pas' {MemberEditForm},
  CarModel in '..\..\Forms\CarModel.pas' {CarModelForm},
  CarModelEdit in '..\..\Forms\CarModelEdit.pas' {CarModelEditForm},
  Car in '..\..\Forms\Car.pas' {CarForm},
  CarEdit in '..\..\Forms\CarEdit.pas' {CarEditForm},
  Position in '..\..\Forms\Guides\Position.pas' {PositionForm},
  PositionEdit in '..\..\Forms\Guides\PositionEdit.pas' {PositionEditForm},
  AssetGroupEdit in '..\..\Forms\Guides\AssetGroupEdit.pas' {AssetGroupEditForm},
  Personal in '..\..\Forms\Guides\Personal.pas' {PersonalForm},
  PersonalEdit in '..\..\Forms\Guides\PersonalEdit.pas' {PersonalEditForm},
  SendJournal in '..\..\Forms\Document\SendJournal.pas' {SendJournalForm},
  ReturnOutJournal in '..\..\Forms\Document\ReturnOutJournal.pas' {ReturnOutJournalForm},
  ReturnOut in '..\..\Forms\Document\ReturnOut.pas' {ReturnOutForm},
  JuridicalTest in '..\SOURCE\Objects\All\JuridicalTest.pas',
  SendOnPriceJournal in '..\..\Forms\Document\SendOnPriceJournal.pas' {SendOnPriceJournalForm},
  SendOnPrice in '..\..\Forms\Document\SendOnPrice.pas' {SendOnPriceForm},
  LossJournal in '..\..\Forms\Document\LossJournal.pas' {LossJournalForm},
  Loss in '..\..\Forms\Document\Loss.pas' {LossForm},
  InventoryJournal in '..\..\Forms\Document\InventoryJournal.pas' {InventoryJournalForm},
  Inventory in '..\..\Forms\Document\Inventory.pas' {InventoryForm},
  ProductionSeparateJournal in '..\..\Forms\Document\ProductionSeparateJournal.pas' {ProductionSeparateJournalForm},
  ProductionUnionJournal in '..\..\Forms\Document\ProductionUnionJournal.pas' {ProductionUnionJournalForm},
  Report_ProfitLoss in '..\..\Forms\Report\Report_ProfitLoss.pas' {Report_ProfitLossForm},
  Report_HistoryCost in '..\..\Forms\Report\Report_HistoryCost.pas' {Report_HistoryCostForm},
  ProductionUnion in '..\..\Forms\Document\ProductionUnion.pas' {ProductionUnionForm},
  ProductionSeparate in '..\..\Forms\Document\ProductionSeparate.pas' {ProductionSeparateForm},
  ContractConditionValue in '..\..\Forms\Guides\ContractConditionValue.pas' {ContractConditionValueForm},
  ContractEdit in '..\..\Forms\Guides\ContractEdit.pas' {ContractEditForm},
  Measure in '..\..\Forms\Measure.pas' {MeasureForm},
  PriceListItem in '..\..\Forms\PriceListItem.pas' {PriceListItemForm},
  ComponentActionTest in '..\SOURCE\Component\ComponentActionTest.pas',
  ComponentDBTest in '..\SOURCE\Component\ComponentDBTest.pas',
  CashOperationTest in '..\SOURCE\Movement\All\CashOperationTest.pas',
  ZakazExternalJournal in '..\..\Forms\Document\ZakazExternalJournal.pas' {ZakazExternalJournalForm},
  ZakazExternal in '..\..\Forms\Document\ZakazExternal.pas' {ZakazExternalForm},
  ZakazInternalJournal in '..\..\Forms\Document\ZakazInternalJournal.pas' {ZakazInternalJournalForm},
  ZakazInternal in '..\..\Forms\Document\ZakazInternal.pas' {ZakazInternalForm},
  CommonObjectCostProcedureTest in '..\SOURCE\ObjectCost\CommonObjectCostProcedureTest.pas',
  BankStatementTest in '..\SOURCE\Movement\All\BankStatementTest.pas',
  BankAccountMovementTest in '..\SOURCE\Movement\All\BankAccountMovementTest.pas',
  ServiceTest in '..\SOURCE\Movement\All\ServiceTest.pas',
  PersonalServiceTest in '..\SOURCE\Movement\All\PersonalServiceTest.pas',
  PersonalReportTest in '..\SOURCE\Movement\All\PersonalReportTest.pas',
  BankStatementItemTest in '..\SOURCE\Movement\All\BankStatementItemTest.pas',
  AccountTest in '..\SOURCE\Objects\All\AccountTest.pas',
  CashTest in '..\SOURCE\Objects\All\CashTest.pas',
  InfoMoneyTest in '..\SOURCE\Objects\All\InfoMoneyTest.pas',
  TransportServiceTest in '..\SOURCE\Movement\All\TransportServiceTest.pas',
  PersonalServiceEdit in '..\..\Forms\PersonalServiceEdit.pas' {PersonalServiceEditForm},
  PersonalService in '..\..\Forms\PersonalService.pas' {PersonalServiceForm},
  Goods_Object in '..\..\Forms\Guides\Goods_Object.pas' {Goods_ObjectForm},
  Unit_Object in '..\..\Forms\Guides\Unit_Object.pas' {Unit_ObjectForm},
  JuridicalTree in '..\..\Forms\Guides\JuridicalTree.pas' {JuridicalTreeForm},
  BankAccountTest in '..\SOURCE\Objects\All\BankAccountTest.pas',
  BusinessTest in '..\SOURCE\Objects\All\BusinessTest.pas',
  CommonMovementItemReportProcedureTest in '..\SOURCE\MovementItemReport\CommonMovementItemReportProcedureTest.pas',
  TradeMarkTest in '..\SOURCE\Objects\All\TradeMarkTest.pas',
  ChoicePeriod in '..\..\SOURCE\COMPONENT\ChoicePeriod.pas' {PeriodChoiceForm},
  Report_MotionGoodsDialog in '..\..\Forms\Report\Report_MotionGoodsDialog.pas' {Report_MotionGoodsDialogForm},
  Report_MotionGoods in '..\..\Forms\Report\Report_MotionGoods.pas' {Report_MotionGoodsForm},
  ActionTest in '..\SOURCE\Objects\All\ActionTest.pas',
  MainForm in '..\..\SOURCE\MainForm.pas' {MainForm},
  Role in '..\..\Forms\Role.pas' {RoleForm},
  RoleEdit in '..\..\Forms\RoleEdit.pas' {RoleEditForm},
  Action in '..\..\Forms\Action.pas' {ActionForm},
  User in '..\..\Forms\User.pas' {UserForm},
  UserEdit in '..\..\Forms\UserEdit.pas' {UserEditForm},
  Process in '..\..\Forms\Enum\Process.pas' {ProcessForm},
  ComponentAddOnTest in '..\SOURCE\Component\ComponentAddOnTest.pas',
  DefaultsTest in '..\SOURCE\Defaults\DefaultsTest.pas',
  Transport in '..\..\Forms\Document\Transport.pas' {TransportForm},
  TransportJournal in '..\..\Forms\Document\TransportJournal.pas' {TransportJournalForm},
  FuelEdit in '..\..\Forms\FuelEdit.pas' {FuelEditForm},
  RateFuelKindEdit in '..\..\Forms\RateFuelKindEdit.pas' {RateFuelKindEditForm},
  RateFuelKind in '..\..\Forms\RateFuelKind.pas' {RateFuelKindForm},
  Fuel in '..\..\Forms\Fuel.pas' {FuelForm},
  RoleTest in '..\SOURCE\Objects\All\RoleTest.pas',
  Defaults in '..\..\SOURCE\COMPONENT\Defaults.pas',
  IncomeFuel in '..\..\Forms\Document\IncomeFuel.pas' {IncomeFuelForm},
  IncomeFuelJournal in '..\..\Forms\Document\IncomeFuelJournal.pas' {IncomeFuelJournalForm},
  Freight in '..\..\Forms\Freight.pas' {FreightForm},
  FreightEdit in '..\..\Forms\FreightEdit.pas' {FreightEditForm},
  RouteKind in '..\..\Forms\Guides\RouteKind.pas' {RouteKindForm},
  RouteKindEdit in '..\..\Forms\Guides\RouteKindEdit.pas' {RouteKindEditForm},
  RateFuel in '..\..\Forms\RateFuel.pas' {RateFuelForm},
  PersonalGroup in '..\..\Forms\Guides\PersonalGroup.pas' {PersonalGroupForm},
  PersonalGroupEdit in '..\..\Forms\Guides\PersonalGroupEdit.pas' {PersonalGroupEditForm},
  PersonalSendCash in '..\..\Forms\Document\PersonalSendCash.pas' {PersonalSendCashForm},
  PersonalSendCashJournal in '..\..\Forms\Document\PersonalSendCashJournal.pas' {PersonalSendCashJournalForm},
  SendDebtTest in '..\SOURCE\Movement\All\SendDebtTest.pas' {$R *.RES},
  SheetWorkTimeTest in '..\SOURCE\Movement\All\SheetWorkTimeTest.pas',
  Report_Fuel in '..\..\Forms\Report\Report_Fuel.pas' {Report_FuelForm},
  Report_Transport in '..\..\Forms\Report\Report_Transport.pas' {Report_TransportForm},
  CrossAddOnViewTestForm in '..\SOURCE\Component\CrossAddOnViewTestForm.pas' {CrossAddOnViewTest},
  Report_Account in '..\..\Forms\Report\Report_Account.pas' {Report_AccountForm},
  MessagesUnit in '..\..\SOURCE\MessagesUnit.pas' {MessagesForm},
  SourceFuel_Object in '..\..\Forms\Guides\SourceFuel_Object.pas' {SourceFuel_ObjectForm: TParentForm},
  CardFuel in '..\..\Forms\CardFuel.pas' {CardFuelForm},
  TicketFuel in '..\..\Forms\TicketFuel.pas' {TicketFuelForm},
  TicketFuelEdit in '..\..\Forms\TicketFuelEdit.pas' {TicketFuelEditForm},
  CardFuelEdit in '..\..\Forms\CardFuelEdit.pas' {CardFuelEditForm},
  SheetWorkTime in '..\..\Forms\Document\SheetWorkTime.pas' {SheetWorkTimeForm},
  SheetWorkTimeJournal in '..\..\Forms\Document\SheetWorkTimeJournal.pas' {SheetWorkTimeJournalForm},
  PositionLevel in '..\..\Forms\Guides\PositionLevel.pas' {PositionLevelForm},
  PositionLevelEdit in '..\..\Forms\Guides\PositionLevelEdit.pas' {PositionLevelEditForm},
  StaffListData in '..\..\Forms\StaffListData.pas' {StaffListDataForm},
  StaffListEdit in '..\..\Forms\StaffListEdit.pas' {StaffListEditForm},
  PersonalTest in '..\SOURCE\Objects\All\PersonalTest.pas',
  SaleMovementItemTest in '..\SOURCE\MovementItem\All\SaleMovementItemTest.pas',
  ModelService in '..\..\Forms\ModelService.pas' {ModelServiceForm},
  ModelServiceKind in '..\..\Forms\Enum\ModelServiceKind.pas' {ModelServiceKindForm},
  UpdaterTest in '..\SOURCE\Component\UpdaterTest.pas',
  AboutBoxUnit in '..\..\SOURCE\AboutBoxUnit.pas' {AboutBox},
  UnilWin in '..\..\SOURCE\UnilWin.pas',
  ModelServiceEdit in '..\..\Forms\ModelServiceEdit.pas' {ModelServiceEditForm: TParentForm},
  StoragePlace_Object in '..\..\Forms\Guides\StoragePlace_Object.pas' {StoragePlace_ObjectForm: TParentForm},
  Report_TransportHoursWork in '..\..\Forms\Report\Report_TransportHoursWork.pas' {Report_TransportHoursWorkForm: TParentForm},
  StaffListChoice in '..\..\Forms\StaffListChoice.pas' {StaffListChoiceForm: TParentForm},
  StaffList in '..\..\Forms\StaffList.pas' {StaffListForm: TParentForm},
  StaffListSummKind in '..\..\Forms\Enum\StaffListSummKind.pas' {StaffListSummKindForm: TParentForm},
  DocumentTaxKind in '..\..\Forms\Kind\DocumentTaxKind.pas' {DocumentTaxKindForm: TParentForm},
  AncestorBase in '..\..\Forms\Ancestor\AncestorBase.pas' {AncestorBaseForm: TParentForm},
  AncestorDialog in '..\..\Forms\Ancestor\AncestorDialog.pas' {AncestorDialogForm: TParentForm},
  AncestorEditDialog in '..\..\Forms\Ancestor\AncestorEditDialog.pas' {AncestorEditDialogForm: TParentForm},
  AncestorData in '..\..\Forms\Ancestor\AncestorData.pas' {AncestorDataForm: TParentForm},
  AncestorReport in '..\..\Forms\Ancestor\AncestorReport.pas' {AncestorReportForm: TParentForm},
  Protocol in '..\..\Forms\System\Protocol.pas' {ProtocolForm: TParentForm},
  AncestorDBGrid in '..\..\Forms\Ancestor\AncestorDBGrid.pas' {AncestorDBGridForm: TParentForm},
  AncestorJournal in '..\..\Forms\Ancestor\AncestorJournal.pas' {AncestorJournalForm: TParentForm},
  ObjectDesc in '..\..\Forms\System\ObjectDesc.pas' {ObjectDescForm: TParentForm},
  CommonObjectDescProcedureTest in '..\SOURCE\ObjectDesc\CommonObjectDescProcedureTest.pas',
  AncestorEnum in '..\..\Forms\Ancestor\AncestorEnum.pas' {AncestorEnumForm: TParentForm},
  Objects in '..\..\Forms\System\Objects.pas' {ObjectForm: TParentForm},
  AncestorDocument in '..\..\Forms\Ancestor\AncestorDocument.pas' {AncestorDocumentForm: TParentForm},
  Send in '..\..\Forms\Document\Send.pas' {SendForm: TParentForm},
  CashJournal in '..\..\Forms\Document\CashJournal.pas' {CashJournalForm: TParentForm},
  Report_GoodsMI_SaleReturnIn in '..\..\Forms\Report\Report_GoodsMI_SaleReturnIn.pas' {Report_GoodsMI_SaleReturnInForm: TParentForm},
  CashOperation in '..\..\Forms\Document\CashOperation.pas' {CashOperationForm: TParentForm},
  SendTicketFuel in '..\..\Forms\Document\SendTicketFuel.pas' {SendTicketFuelForm: TParentForm},
  SendTicketFuelJournal in '..\..\Forms\Document\SendTicketFuelJournal.pas' {SendTicketFuelJournalForm: TParentForm},
  Units in '..\..\Forms\Guides\Units.pas' {UnitForm: TParentForm},
  Goods in '..\..\Forms\Guides\Goods.pas' {GoodsForm: TParentForm},
  BankAccountJournal in '..\..\Forms\Document\BankAccountJournal.pas' {BankAccountJournalForm: TParentForm},
  ClientBankLoad in '..\..\SOURCE\COMPONENT\ClientBankLoad.pas',
  MemDBFTable in '..\..\SOURCE\MemDBFTable.pas',
  SimpleGauge in '..\..\SOURCE\SimpleGauge.pas' {SimpleGaugeForm},
  ContractStateKind in '..\..\Forms\Enum\ContractStateKind.pas' {ContractStateKindForm: TParentForm},
  ContractArticleEdit in '..\..\Forms\Guides\ContractArticleEdit.pas' {ContractArticleEditForm: TParentForm},
  ContractArticle in '..\..\Forms\Guides\ContractArticle.pas' {ContractArticleForm: TParentForm},
  Area in '..\..\Forms\Guides\Area.pas' {AreaForm: TParentForm},
  AreaEdit in '..\..\Forms\Guides\AreaEdit.pas' {AreaEditForm: TParentForm},
  BankStatement in '..\..\Forms\Document\BankStatement.pas' {BankStatementForm: TParentForm},
  ContractChoicePartner in '..\..\Forms\Guides\ContractChoicePartner.pas' {ContractChoicePartnerForm: TParentForm},
  ContractConditionKind in '..\..\Forms\Enum\ContractConditionKind.pas' {ContractConditionKindForm: TParentForm},
  ServiceJournal in '..\..\Forms\Document\ServiceJournal.pas' {ServiceJournalForm: TParentForm},
  MoneyPlace_Object in '..\..\Forms\Guides\MoneyPlace_Object.pas' {MoneyPlace_ObjectForm: TParentForm},
  Service in '..\..\Forms\Document\Service.pas' {ServiceForm: TParentForm},
  AncestorGuides in '..\..\Forms\Ancestor\AncestorGuides.pas' {AncestorGuidesForm: TParentForm},
  Personal_Object in '..\..\Forms\Guides\Personal_Object.pas' {Personal_ObjectForm: TParentForm},
  WorkTimeKind in '..\..\Forms\Enum\WorkTimeKind.pas' {WorkTimeKindForm: TParentForm},
  MovementDesc in '..\..\Forms\Kind\MovementDesc.pas' {MovementDescForm: TParentForm},
  JuridicalEdit in '..\..\Forms\Guides\JuridicalEdit.pas' {JuridicalEditForm: TParentForm},
  JuridicalDetailsTest in '..\SOURCE\ObjectHistory\All\JuridicalDetailsTest.pas',
  WorkTimeKind_Object in '..\..\Forms\Enum\WorkTimeKind_Object.pas' {WorkTimeKind_ObjectForm: TParentForm},
  Calendar in '..\..\Forms\Guides\Calendar.pas' {CalendarForm: TParentForm},
  GoodsTree_Object in '..\..\Forms\Guides\GoodsTree_Object.pas' {GoodsTree_ObjectForm: TParentForm},
  BankStatementJournal in '..\..\Forms\Document\BankStatementJournal.pas' {BankStatementJournalForm: TParentForm},
  BankAccountMovement in '..\..\Forms\Document\BankAccountMovement.pas' {BankAccountMovementForm: TParentForm},
  Document in '..\..\SOURCE\COMPONENT\Document.pas',
  SetUserDefaults in '..\..\Forms\System\SetUserDefaults.pas' {SetUserDefaultsForm: TParentForm},
  DefaultsKey in '..\..\Forms\System\DefaultsKey.pas' {DefaultsKeyForm: TParentForm},
  FormsUnit in '..\..\Forms\System\FormsUnit.pas' {FormsForm: TParentForm},
  UnionDesc in '..\..\Forms\System\UnionDesc.pas' {UnionDescForm: TParentForm},
  SendDebtJournal in '..\..\Forms\Document\SendDebtJournal.pas' {SendDebtJournalForm: TParentForm},
  BranchEdit in '..\..\Forms\Guides\BranchEdit.pas' {BranchEditForm: TParentForm},
  Branch in '..\..\Forms\Guides\Branch.pas' {BranchForm: TParentForm},
  Branch_Object in '..\..\Forms\Guides\Branch_Object.pas' {Branch_ObjectForm: TParentForm},
  Cash in '..\..\Forms\Guides\Cash.pas' {CashForm: TParentForm},
  CashEdit in '..\..\Forms\Guides\CashEdit.pas' {CashEditForm: TParentForm},
  Cash_Object in '..\..\Forms\Guides\Cash_Object.pas' {Cash_ObjectForm: TParentForm},
  SendDebt in '..\..\Forms\Document\SendDebt.pas' {SendDebtForm: TParentForm},
  TransportServiceJournal in '..\..\Forms\Document\TransportServiceJournal.pas' {TransportServiceJournalForm: TParentForm},
  UserKey in '..\..\Forms\Guides\UserKey.pas' {UserKeyForm: TParentForm},
  MovementItemContainer in '..\..\Forms\System\MovementItemContainer.pas' {MovementItemContainerForm: TParentForm},
  InfoMoney in '..\..\Forms\Guides\InfoMoney.pas' {InfoMoneyForm: TParentForm},
  SalaryCalculation in '..\SOURCE\Calculation\SalaryCalculation.pas',
  Juridical in '..\..\Forms\Guides\Juridical.pas' {JuridicalForm: TParentForm},
  ReturnInTest in '..\SOURCE\Movement\All\ReturnInTest.pas',
  TransportTest in '..\SOURCE\Movement\All\TransportTest.pas',
  SheetWorkTimeAddRecord in '..\..\Forms\Document\SheetWorkTimeAddRecord.pas' {SheetWorkTimeAddRecordForm: TParentForm},
  PartnerJuridicalEdit in '..\..\Forms\Guides\PartnerJuridicalEdit.pas' {PartnerJuridicalEditForm: TParentForm},
  PartnerEdit in '..\..\Forms\Guides\PartnerEdit.pas' {PartnerEditForm: TParentForm},
  PersonalAccountTest in '..\SOURCE\Movement\All\PersonalAccountTest.pas',
  PersonalAccount in '..\..\Forms\Document\PersonalAccount.pas' {PersonalAccountForm: TParentForm},
  PersonalAccountJournal in '..\..\Forms\Document\PersonalAccountJournal.pas' {PersonalAccountJournalForm: TParentForm},
  City in '..\..\Forms\Guides\City.pas' {CityForm: TParentForm},
  GoodsEdit in '..\..\Forms\Guides\GoodsEdit.pas' {GoodsEditForm: TParentForm},
  CityEdit in '..\..\Forms\Guides\CityEdit.pas' {CityEditForm: TParentForm},
  Partner in '..\..\Forms\Guides\Partner.pas' {PartnerForm: TParentForm},
  ContractChoice in '..\..\Forms\Guides\ContractChoice.pas' {ContractChoiceForm: TParentForm},
  ReturnInJournal in '..\..\Forms\Document\ReturnInJournal.pas' {ReturnInJournalForm: TParentForm},
  ReturnIn in '..\..\Forms\Document\ReturnIn.pas' {ReturnInForm: TParentForm},
  Report_JuridicalCollation in '..\..\Forms\Report\Report_JuridicalCollation.pas' {Report_JuridicalCollationForm: TParentForm},
  Report_JuridicalSold in '..\..\Forms\Report\Report_JuridicalSold.pas' {Report_JuridicalSoldForm: TParentForm},
  MovementDescForms in '..\..\Forms\System\MovementDescForms.pas' {MovementDescDataForm: TParentForm},
  Report_Goods in '..\..\Forms\Report\Report_Goods.pas' {Report_GoodsForm: TParentForm},
  LossDebtJournal in '..\..\Forms\Document\LossDebtJournal.pas' {LossDebtJournalForm: TParentForm},
  LossDebt in '..\..\Forms\Document\LossDebt.pas' {LossDebtForm: TParentForm},
  TransportService in '..\..\Forms\Document\TransportService.pas' {TransportServiceForm: TParentForm},
  TaxCorrectiveJournal in '..\..\Forms\Document\TaxCorrectiveJournal.pas' {TaxCorrectiveJournalForm: TParentForm},
  TaxCorrective in '..\..\Forms\Document\TaxCorrective.pas' {TaxCorrectiveForm: TParentForm},
  Partner1CLink in '..\..\Forms\Guides\Partner1CLink.pas' {Partner1CLinkForm: TParentForm},
  GoodsByGoodsKind1CLink in '..\..\Forms\Guides\GoodsByGoodsKind1CLink.pas' {GoodsByGoodsKind1CLinkForm: TParentForm},
  LossDebtTest in '..\SOURCE\Movement\All\LossDebtTest.pas',
  dbMeatTest in '..\SOURCE\dbMeatTest.pas',
  LoadSaleFrom1C in '..\..\Forms\LOAD1C\LoadSaleFrom1C.pas' {LoadSaleFrom1CForm: TParentForm},
  ExternalDocumentLoad in '..\..\SOURCE\COMPONENT\ExternalDocumentLoad.pas',
  ExternalLoad in '..\..\SOURCE\COMPONENT\ExternalLoad.pas',
  ExternalLoadTest in '..\SOURCE\Component\ExternalLoadTest.pas',
  PersonalSendCashTest in '..\SOURCE\Movement\All\PersonalSendCashTest.pas',
  SheetWorkTimeMovementItemTest in '..\SOURCE\MovementItem\All\SheetWorkTimeMovementItemTest.pas',
  Report_GoodsMI_IncomeByPartner in '..\..\Forms\Report\Report_GoodsMI_IncomeByPartner.pas' {Report_GoodsMI_IncomeByPartnerForm: TParentForm},
  Report_GoodsMI_Income in '..\..\Forms\Report\Report_GoodsMI_Income.pas' {Report_GoodsMI_IncomeForm: TParentForm},
  Account in '..\..\Forms\Guides\Account.pas' {AccountForm: TParentForm},
  Contract in '..\..\Forms\Guides\Contract.pas' {ContractForm: TParentForm},
  Log in '..\..\SOURCE\Log.pas',
  Report_GoodsMI in '..\..\Forms\Report\Report_GoodsMI.pas' {Report_GoodsMIForm: TParentForm},
  Report_GoodsMI_byMovement in '..\..\Forms\Report\Report_GoodsMI_byMovement.pas' {Report_GoodsMI_byMovementForm: TParentForm},
  Report_JuridicalDefermentPayment in '..\..\Forms\Report\Report_JuridicalDefermentPayment.pas' {TReport_JuridicalDefermentPayment: TParentForm},
  SaleJournal in '..\..\Forms\Document\SaleJournal.pas' {SaleJournalForm: TParentForm},
  Sale in '..\..\Forms\Document\Sale.pas' {SaleForm: TParentForm},
  PaidKind in '..\..\Forms\Kind\PaidKind.pas' {PaidKindForm: TParentForm},
  UnitCarMember_Object in '..\..\Forms\Guides\UnitCarMember_Object.pas' {UnitCarMember_ObjectForm: TParentForm},
  Tax in '..\..\Forms\Document\Tax.pas' {TaxForm: TParentForm},
  TaxJournal in '..\..\Forms\Document\TaxJournal.pas' {TaxJournalForm: TParentForm},
  GoodsFuel_Object in '..\..\Forms\Guides\GoodsFuel_Object.pas' {GoodsFuel_ObjectForm: TParentForm},
  Maker in '..\..\Forms\Guides\Maker.pas' {MakerForm: TParentForm},
  JuridicalGroupEdit in '..\..\Forms\Guides\JuridicalGroupEdit.pas' {JuridicalGroupEditForm: TParentForm},
  AssetGroup in '..\..\Forms\Guides\AssetGroup.pas' {AssetGroupForm: TParentForm},
  Asset in '..\..\Forms\Guides\Asset.pas' {AssetForm: TParentForm},
  AssetEdit in '..\..\Forms\Guides\AssetEdit.pas' {AssetEditForm: TParentForm},
  JuridicalGroup in '..\..\Forms\Guides\JuridicalGroup.pas' {JuridicalGroupForm: TParentForm},
  SelectKind in '..\..\Forms\Kind\SelectKind.pas' {SelectKindForm: TParentForm},
  Country in '..\..\Forms\Guides\Country.pas' {CountryForm: TParentForm},
  DocumentTaxKindTest in '..\SOURCE\Objects\All\DocumentTaxKindTest.pas',
  SaleTest in '..\SOURCE\Movement\All\SaleTest.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
  DUnitTestRunner.RunRegisteredTests;
end.

