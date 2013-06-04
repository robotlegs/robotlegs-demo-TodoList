package example.todo
{
	import example.todo.core.domain.TodoCollectionTests;
	import example.todo.core.domain.TodoTests;
	import example.todo.todoForm.TodoFormConfigTests;
	import example.todo.todoForm.command.CreateNewTodoCommandTests;
	import example.todo.todoForm.command.UpdateTodoCommandTests;
	import example.todo.todoForm.mediator.TodoFormViewMediatorTests;
	import example.todo.todoForm.signal.CreateNewTodoSignalTests;
	import example.todo.todoForm.signal.UpdateTodoSignalTests;
	import example.todo.todoForm.view.TodoFormViewTests;
	import example.todo.todoList.TodoListConfigTests;
	import example.todo.todoList.command.CompleteTodoCommandTests;
	import example.todo.todoList.mediator.TodoListViewMediatorTests;
	import example.todo.todoList.signal.CompleteTodoSignalTests;
	import example.todo.todoList.view.TodoListViewTests;
	import example.todo.core.ui.PopupTests;
	import example.todo.core.util.VectorUtilTests;

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
		
		public var todoTests: TodoTests;
		public var todoCollectionTests: TodoCollectionTests;
		public var popupTests: PopupTests;
		public var vectorUtilTests: VectorUtilTests;
	}
}