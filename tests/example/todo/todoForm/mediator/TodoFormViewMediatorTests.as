package example.todo.todoForm.mediator
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.isTrue;
	import org.mockito.integrations.any;
	import org.mockito.integrations.flexunit4.MockitoRule;
	import org.mockito.integrations.given;
	import org.mockito.integrations.mock;
	import org.mockito.integrations.never;
	import org.mockito.integrations.times;
	import org.mockito.integrations.verify;
	import org.osflash.signals.Signal;
	import org.osflash.signals.utils.proceedOnSignal;
	
	import example.todo.core.domain.Todo;
	import example.todo.core.domain.api.ITodoCollection;
	import example.todo.todoForm.signal.CreateNewTodoSignal;
	import example.todo.todoForm.signal.UpdateTodoSignal;
	import example.todo.core.ui.api.IPopup;
	import example.todo.todoForm.view.api.ITodoFormView;
	import example.todo.testing.MediatorTests;

	[Mock(type="example.todo.core.ui.api.IPopup")]
	[Mock(type="example.todo.todoForm.view.api.ITodoFormView")]
	[Mock(type="example.todo.todoForm.signal.CreateNewTodoSignal")]
	[Mock(type="example.todo.todoForm.signal.UpdateTodoSignal")]
	[Mock(type="robotlegs.bender.extensions.localEventMap.api.IEventMap")]
	[Mock(type="example.todo.core.domain.api.ITodoCollection")]
	public class TodoFormViewMediatorTests extends MediatorTests
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
		 * Tests when the mediator is destroyed the
		 * view is disposed of.
		 */
		[Test]
		public function destory_ViewIsDisposed(): void
		{
			var todoFormViewMediator: TodoFormViewMediator = createMediator();
			todoFormViewMediator.destroy();	
			verify(times(1)).that(_todoFormView.dispose());
		}
		
		/**
		 * Tests when the mediator is destory the dependencies
		 * are nullified.
		 */
		[Test]
		public function destory_NullifiesDependencies(): void
		{
			var todoFormViewMediator: TodoFormViewMediator = createMediator();
			todoFormViewMediator.destroy();
			
			assertThat(!todoFormViewMediator.view && !todoFormViewMediator.popup, isTrue()); 
		}
		
		/**
		 * Tests that when the saveSignal on the view is dispatched the createNewTodoSignal
		 * is dispatched.
		 */
		[Test]
		public function saveSignalDispatched_TodoCollectionHasNoActive_ShouldDispatchCreateNewTodoSignal(): void
		{
			const expectedTaskDescription: String = "My dummy task.";
			
			var todoFormViewMediator: TodoFormViewMediator = createMediator();
			simulateSave(expectedTaskDescription);
			
			verify(times(1)).that(todoFormViewMediator.createNewTodoSignal.dispatch(expectedTaskDescription));
			verify(never()).that(todoFormViewMediator.updateTodoSignal.dispatch(expectedTaskDescription));
		}
		
		/**
		 * Tests that when the saveSignal on the view is dispatched the view
		 * is removed as a popup in the UI.
		 */
		[Test]
		public function saveSignalDispatched_viewIsRemovedAsPopup(): void
		{
			var todoFormViewMediator: TodoFormViewMediator = createMediator();
			simulateSave( "My dummy task.");
			
			verify(times(1)).that(todoFormViewMediator.popup.remove(_todoFormView));
		}
		
		/**
		 * When the mediator is initialized, if there is an active Todo on the todo
		 * collection, then the description of the task should be set as the taskDescription
		 * on the view.
		 */
		[Test]
		public function initialize_WithActiveTodo_SetsTaskDescriptionOnView(): void
		{
			const expectedTaskDescription: String = "My dummy task.";
			var activeTodo: Todo = new Todo();
			activeTodo.task = expectedTaskDescription;
			
			var todoFormViewMediator: TodoFormViewMediator = createMediator(activeTodo);
			
			verify(times(1)).that(todoFormViewMediator.view.taskDescription = expectedTaskDescription);
		}
		
		/**
		 * Tests that when the user wishes to save and the TodoCollection has an active Todo, the UpdateTodoSignal
		 * is dispatched.
		 */
		[Test]
		public function saveSignalDispatched_TodoCollectionHasActive_ShouldDispatchUpdateTodoSignal(): void
		{
			const expectedTaskDescription: String = "My dummy task.";
			
			var todoFormViewMediator: TodoFormViewMediator = createMediator(new Todo());
			simulateSave(expectedTaskDescription);
			
			verify(times(1)).that(todoFormViewMediator.updateTodoSignal.dispatch(expectedTaskDescription));
			verify(never()).that(todoFormViewMediator.createNewTodoSignal.dispatch(expectedTaskDescription));
		}
		
		/**
		 * Creates the test subject with its dependencies.
		 */
		private function createMediator(activeTodo: Todo = null): TodoFormViewMediator
		{
			var todoFormViewMediator: TodoFormViewMediator = new TodoFormViewMediator();
			todoFormViewMediator.popup = mock(IPopup);
			todoFormViewMediator.view = createMockOfTodoFormView();
			todoFormViewMediator.createNewTodoSignal = mock(CreateNewTodoSignal);
			todoFormViewMediator.updateTodoSignal = mock(UpdateTodoSignal);
			todoFormViewMediator.todoCollection = mock(ITodoCollection);
			given(todoFormViewMediator.todoCollection.activeTodo).willReturn(activeTodo);
			
			setupMediator(todoFormViewMediator);
			
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
			given(_todoFormView.saveSignal).willReturn(new Signal());
			return _todoFormView;
		}
		
		/**
		 * Simulates the user wanting to cancel the todo form.
		 */
		private function simulateCancel(): void
		{
			(_todoFormView.cancelSignal as Signal).dispatch();
		}
		
		/**
		 * Simulates the user wanting to save the todo form.
		 */
		private function simulateSave(taskDescription: String): void
		{
			given(_todoFormView.taskDescription).willReturn(taskDescription);
			(_todoFormView.saveSignal as Signal).dispatch();
		}
	}
}