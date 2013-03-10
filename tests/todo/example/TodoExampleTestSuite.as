package todo.example
{
	import todo.example.config.AppConfigurationTests;
	import todo.example.domain.TodoCollectionTests;
	import todo.example.domain.TodoTests;
	import todo.example.todoForm.TodoFormConfigTests;
	import todo.example.todoForm.command.CreateNewTodoCommandTests;
	import todo.example.todoForm.command.UpdateTodoCommandTests;
	import todo.example.todoForm.mediator.TodoFormViewMediatorTests;
	import todo.example.todoForm.signal.CreateNewTodoSignalTests;
	import todo.example.todoForm.signal.UpdateTodoSignalTests;
	import todo.example.todoForm.view.TodoFormViewTests;
	import todo.example.todoList.TodoListConfigTests;
	import todo.example.todoList.command.CompleteTodoCommandTests;
	import todo.example.todoList.mediator.TodoListViewMediatorTests;
	import todo.example.todoList.signal.CompleteTodoSignalTests;
	import todo.example.todoList.view.TodoListViewTests;
	import todo.example.ui.PopupTests;
	import todo.example.util.VectorUtilTests;
	import todo.example.view.MainViewTests;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TodoExampleTestSuite
	{
		public var appConfigurationTests: AppConfigurationTests;
		
		public var todoFormConfigTests: TodoFormConfigTests;
		public var todoFormViewTests: TodoFormViewTests;
		public var todoFormViewMediatorTests: TodoFormViewMediatorTests;		
		public var createNewTodoSignalTests: CreateNewTodoSignalTests;
		public var updateTodoSignalTests: UpdateTodoSignalTests;
		public var createNewTodoCommandTests: CreateNewTodoCommandTests;
		public var updateTodoCommandTests: UpdateTodoCommandTests;
		
		public var todoListConfigTests: TodoListConfigTests;
		public var todoListViewTests: TodoListViewTests;
		public var todoListViewMediatorTests: TodoListViewMediatorTests;
		public var completeTodoSignalTests: CompleteTodoSignalTests;		
		public var completeTodoCommandTests: CompleteTodoCommandTests;
		
		public var mainViewTests: MainViewTests;
		public var todoTests: TodoTests;
		public var todoCollectionTests: TodoCollectionTests;
		public var popupTests: PopupTests;
		public var vectorUtilTests: VectorUtilTests;
	}
}