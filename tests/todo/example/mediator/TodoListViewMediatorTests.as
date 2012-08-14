package todo.example.mediator
{
	import mx.collections.ArrayCollection;
	
	import org.hamcrest.assertThat;
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
	import todo.example.ui.api.IPopup;
	import todo.example.view.TodoFormView;
	import todo.example.view.api.ITodoFormView;
	import todo.example.view.api.ITodoListView;

	[Mock(type="todo.example.domain.api.ITodoCollection")]
	[Mock(type="todo.example.ui.api.IPopup")]
	[Mock(type="todo.example.view.api.ITodoListView")]
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
			var expectedTodos: Vector.<Todo> = createFakeTodos();
			var todoListViewMediator: TodoListViewMediator = createMediator(false);
			
			setupTodosCollection(todoListViewMediator.todoCollection, expectedTodos);
			todoListViewMediator.initialize();
			
			changeTodosCollection(todoListViewMediator.todoCollection);
			
			// this needs to be refactored so the verification is that
			// the item returned by the all() method on TodoCollection
			// is passed to setTasks instead of any().
			verify(times(1)).that(_todoListView.setTasks(any()));
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
		private function createFakeTodos(): Vector.<Todo>
		{
			var todos: Vector.<Todo> = new Vector.<Todo>();
			todos.push(new Todo());
			todos.push(new Todo());
			todos.push(new Todo());
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
			
			setupMediator(todoListViewMediator);
			
			if (initialize) {
				setupTodosCollection(todoListViewMediator.todoCollection, new Vector.<Todo>());
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
			return _todoListView;
		}
		
		/**
		 * Sets up the TodoCollection so it returns the tasks argument when
		 * the all() method is accessed, and also so it has a changedSignal.
		 */
		private function setupTodosCollection(todoCollection: ITodoCollection, tasks: Vector.<Todo>): void
		{
			given(todoCollection.changedSignal).willReturn(new Signal());
			given(todoCollection.all()).willReturn(tasks);
		}
		
		/**
		 * Simulates the user wanting to create a new
		 * todo item.
		 */
		private function simulateCreateNew(): void
		{
			(_todoListView.createNewSignal as Signal).dispatch();
		}
	}
}