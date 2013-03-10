package todo.example
{
	import todo.example.bundle.AppBundleTests;
	import todo.example.todoList.command.CompleteTodoCommandTests;
	import todo.example.todoForm.command.CreateNewTodoCommandTests;
	import todo.example.todoForm.command.UpdateTodoCommandTests;
	import todo.example.config.AppConfigurationTests;
	import todo.example.domain.TodoCollectionTests;
	import todo.example.domain.TodoTests;
	import todo.example.todoForm.mediator.TodoFormViewMediatorTests;
	import todo.example.todoList.mediator.TodoListViewMediatorTests;
	import todo.example.todoList.signal.CompleteTodoSignalTests;
	import todo.example.todoForm.signal.CreateNewTodoSignalTests;
	import todo.example.todoForm.signal.UpdateTodoSignalTests;
	import todo.example.ui.PopupTests;
	import todo.example.util.VectorUtilTests;
	import todo.example.view.MainViewTests;
	import todo.example.todoForm.view.TodoFormViewTests;
	import todo.example.todoList.view.TodoListViewTests;

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
		public var updateTodoSignalTests: UpdateTodoSignalTests;
	
		public var completeTodoCommandTests: CompleteTodoCommandTests;
		public var createNewTodoCommandTests: CreateNewTodoCommandTests;
		public var updateTodoCommandTests: UpdateTodoCommandTests;
		
		public var vectorUtilTests: VectorUtilTests;
	}
}