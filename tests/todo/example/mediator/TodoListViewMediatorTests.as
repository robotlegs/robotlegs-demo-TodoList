package todo.example.mediator
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.isTrue;
	import org.mockito.impl.ReturningAnswer;
	import org.mockito.integrations.anyOf;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.given;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	import org.osflash.signals.Signal;
	
	import todo.example.ui.api.IPopup;
	import todo.example.view.TodoFormView;
	import todo.example.view.api.ITodoFormView;
	import todo.example.view.api.ITodoListView;

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
			
			assertThat(!todoListViewMediator.view && !todoListViewMediator.popup, isTrue());
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createMediator(): TodoListViewMediator
		{
			var todoListViewMediator: TodoListViewMediator = new TodoListViewMediator();
			todoListViewMediator.popup = mock(IPopup);
			todoListViewMediator.view = createMockOfTodoListView();
			
			setupMediator(todoListViewMediator);
			
			todoListViewMediator.initialize();
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
		 * Simulates the user wanting to create a new
		 * todo item.
		 */
		private function simulateCreateNew(): void
		{
			(_todoListView.createNewSignal as Signal).dispatch();
		}
	}
}