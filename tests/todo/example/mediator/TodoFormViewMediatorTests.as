package todo.example.mediator
{
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.given;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	import org.osflash.signals.Signal;
	
	import todo.example.ui.api.IPopup;
	import todo.example.view.api.ITodoFormView;

	[Mock(type="todo.example.ui.api.IPopup")]
	[Mock(type="todo.example.view.api.ITodoFormView")]
	public class TodoFormViewMediatorTests
	{
		private var _todoFormView: ITodoFormView;
		
		[Rule]
		public var mockitoRule: MockitoRule = new MockitoRule();
		
		/**
		 * Tests that when the cancelSignal is dispatched to signify the user
		 * wishing to quit the todo form, the view is removed as a popup.
		 */
		[Test]
		public function cancelSignalDispatched_viewIsRemovedAsPopup(): void
		{
			var todoFormViewMediator: TodoFormViewMediator = createMediator();
			simulateCancel();
			
			verify(times(1)).that(todoFormViewMediator.popup.remove(_todoFormView));
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createMediator(): TodoFormViewMediator
		{
			var todoFormViewMediator: TodoFormViewMediator = new TodoFormViewMediator();
			todoFormViewMediator.popup = mock(IPopup);
			todoFormViewMediator.view = createMockOfTodoFormView();
			todoFormViewMediator.initialize();
			return todoFormViewMediator;
		}
		
		/**
		 * Creates a mock of the TodoFormView with its signals set.
		 */
		private function createMockOfTodoFormView(): ITodoFormView
		{
			_todoFormView = mock(ITodoFormView);
			given(_todoFormView.cancelSignal).willReturn(new Signal());
			return _todoFormView;
		}
		
		/**
		 * Simulates the user wanting to cancel the todo form.
		 */
		private function simulateCancel(): void
		{
			(_todoFormView.cancelSignal as Signal).dispatch();
		}
	}
}