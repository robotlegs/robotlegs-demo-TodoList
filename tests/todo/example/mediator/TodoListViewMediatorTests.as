package todo.example.mediator
{
	import mx.collections.ArrayCollection;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;
	import org.mockito.impl.ReturningAnswer;
	import org.mockito.impl.matchers.Matchers;
	import org.mockito.integrations.any;
	import org.mockito.integrations.anyOf;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.given;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	import org.osflash.signals.Signal;
	
	import todo.example.domain.Todo;
	import todo.example.domain.api.ITodoCollection;
	import todo.example.signal.CompleteTodoSignal;
	import todo.example.ui.api.IPopup;
	import todo.example.view.TodoFormView;
	import todo.example.view.api.ITodoFormView;
	import todo.example.view.api.ITodoListView;

	[Mock(type="todo.example.domain.api.ITodoCollection")]
	[Mock(type="todo.example.ui.api.IPopup")]
	[Mock(type="todo.example.view.api.ITodoListView")]
	[Mock(type="todo.example.signal.CompleteTodoSignal")]
	[Mock(type="robotlegs.bender.extensions.localEventMap.api.IEventMap")]
	public class TodoListViewMediatorTests extends MediatorTests
	{
		private var _todoListView: ITodoListView;
		
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		/**
		 * Tests that when the createNewSignal is dispatched signifying that the
		 * user wishes to create a new todo item they're presented with the TodoFormView
		 * as a popup.
		 */
		[Test]
		public function createNewSignalDispatched_AddTodoFormViewAsPopup(): void
		{
			var todoListViewMediator: TodoListViewMediator = createMediator();
			simulateCreateNew();
			
			verify(times(1)).that(todoListViewMediator.popup.add(anyOf(TodoFormView)));
		}
		
		/**
		 * Destroy should dispose of the view.
		 */
		[Test]
		public function destroy_ViewIsDisposed(): void
		{
			var todoListViewMediator: TodoListViewMediator = createMediator();
			todoListViewMediator.destroy();
			
			verify(times(1)).that(_todoListView.dispose());
		}
		
		/**
		 * Destroy should nullify the dependencies.
		 */
		[Test]
		public function destory_NullifiesDependencies(): void
		{
			var todoListViewMediator: TodoListViewMediator = createMediator();
			todoListViewMediator.destroy();
			
			assertThat(!todoListViewMediator.view && !todoListViewMediator.popup && !todoListViewMediator.todoCollection, isTrue());
		}
		
		/**
		 * Tests that when a change occurs to the todosCollection,
		 * the tasks are set onto the view.
		 */
		[Test]
		public function todosChange_ShouldSetTasksOnView(): void
		{
			var expectedTodos: ArrayCollection = createFakeTodos();
			var todoListViewMediator: TodoListViewMediator = createMediator(false);
			
			setupTodosCollection(todoListViewMediator.todoCollection, expectedTodos);
			todoListViewMediator.initialize();
			
			changeTodosCollection(todoListViewMediator.todoCollection);
			
			verify(times(1)).that(_todoListView.setTodos(expectedTodos));
		}
		
		/**
		 * Tests that when the user wishes to complete a todo, the CompleteTodoSignal
		 * is dispatched with the todo.
		 */
		[Test(async)]
		public function todoComplete_ShouldDispatchCompleteTodoSignalWithTodo(): void
		{
			var expectedTodo: Todo = new Todo();
			var todoListViewMediator: TodoListViewMediator = createMediator();
			
			simulateCompleteTodo(expectedTodo);
			
			verify(times(1)).that(todoListViewMediator.completeTodoSignal.dispatch(expectedTodo));
		}
		
		/**
		 * Tests that when the user wishes to the modify a todo, the
		 * TodoFormView should be added as a popup.
		 */
		[Test]
		public function modifyTodo_AddTodoFormViewAsPopup(): void
		{
			var todoListViewMediator: TodoListViewMediator = createMediator();
			simulateModify(new Todo());
			
			verify(times(1)).that(todoListViewMediator.popup.add(anyOf(TodoFormView)));			
		}
		
		/**
		 * Tests that when the user wishes to modify a todo, that todo is
		 * set as the activeTodo on the TodoCollection.
		 */
		[Test]
		public function modifyTodo_SetsTodoAsActiveTodoOnTodoCollection(): void
		{
			var expectedTodo: Todo = new Todo();
			var todoListViewMediator: TodoListViewMediator = createMediator();
			simulateModify(expectedTodo);
			
			verify(times(1)).that(todoListViewMediator.todoCollection.activeTodo = expectedTodo);
		}
		
		/**
		 * Simulates the todos collection being changed.
		 */
		private function changeTodosCollection(todoCollection: ITodoCollection): void
		{
			(todoCollection.changedSignal as Signal).dispatch();
		}
		
		/**
		 * Creates a collection of fake todos.
		 */
		private function createFakeTodos(): ArrayCollection
		{
			var todos: ArrayCollection = new ArrayCollection();
			todos.addItem(new Todo());
			todos.addItem(new Todo());
			todos.addItem(new Todo());
			return todos;
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createMediator(initialize: Boolean = true): TodoListViewMediator
		{
			var todoListViewMediator: TodoListViewMediator = new TodoListViewMediator();
			todoListViewMediator.popup = mock(IPopup);
			todoListViewMediator.view = createMockOfTodoListView();
			todoListViewMediator.todoCollection = mock(ITodoCollection);
			todoListViewMediator.completeTodoSignal = mock(CompleteTodoSignal);
			
			setupMediator(todoListViewMediator);
			
			if (initialize) {
				setupTodosCollection(todoListViewMediator.todoCollection, new ArrayCollection());
				todoListViewMediator.initialize();
			}
			
			return todoListViewMediator;
		}
		
		/**
		 * Creates a mock of the TodoListView with its signals set.
		 */
		private function createMockOfTodoListView(): ITodoListView
		{
			_todoListView = mock(ITodoListView);
			given(_todoListView.createNewSignal).willReturn(new Signal());
			given(_todoListView.completeSignal).willReturn(new Signal(Todo));
			given(_todoListView.modifySignal).willReturn(new Signal(Todo));
			return _todoListView;
		}
		
		/**
		 * Sets up the TodoCollection so it returns the tasks argument when
		 * the all() method is accessed, and also so it has a changedSignal.
		 */
		private function setupTodosCollection(todoCollection: ITodoCollection, tasks: ArrayCollection): void
		{
			given(todoCollection.changedSignal).willReturn(new Signal());
			given(todoCollection.all()).willReturn(tasks);
		}
		
		/**
		 * Simulates the user wanting to complete a todo.
		 */
		private function simulateCompleteTodo(todo: Todo): void
		{
			(_todoListView.completeSignal as Signal).dispatch(todo);
		}		
		
		/**
		 * Simulates the user wanting to create a new
		 * todo item.
		 */
		private function simulateCreateNew(): void
		{
			(_todoListView.createNewSignal as Signal).dispatch();
		}

		/**
		 * Simulates the user wanting to modifying a
		 * todo item.
		 */
		private function simulateModify(todo: Todo): void
		{
			(_todoListView.modifySignal as Signal).dispatch(todo);
		}
	}
}