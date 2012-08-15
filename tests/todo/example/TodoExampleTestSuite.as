package todo.example
{
	import todo.example.bundle.AppBundleTests;
	import todo.example.command.CreateNewTodoCommandTests;
	import todo.example.config.AppConfigurationTests;
	import todo.example.domain.TodoCollectionTests;
	import todo.example.domain.TodoTests;
	import todo.example.mediator.TodoFormViewMediatorTests;
	import todo.example.mediator.TodoListViewMediatorTests;
	import todo.example.signal.CompleteTodoSignalTests;
	import todo.example.signal.CreateNewTodoSignalTests;
	import todo.example.ui.PopupTests;
	import todo.example.util.VectorUtilTests;
	import todo.example.view.MainViewTests;
	import todo.example.view.TodoFormViewTests;
	import todo.example.view.TodoListViewTests;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TodoExampleTestSuite
	{
		public var appBundleTests: AppBundleTests;
		public var appConfigurationTests: AppConfigurationTests;
		
		public var mainViewTests: MainViewTests;
		public var todoFormViewTests: TodoFormViewTests;
		public var todoListViewTests: TodoListViewTests;
		
		public var todoFormViewMediatorTests: TodoFormViewMediatorTests;
		public var todoListViewMediatorTests: TodoListViewMediatorTests;
		
		public var todoTests: TodoTests;
		public var todoCollectionTests: TodoCollectionTests;
		
		public var popupTests: PopupTests;
	
		public var completeTodoSignalTests: CompleteTodoSignalTests;
		public var createNewTodoSignalTests: CreateNewTodoSignalTests;
	
		public var createNewTodoCommandTests: CreateNewTodoCommandTests;
		
		public var vectorUtilTests: VectorUtilTests;
	}
}