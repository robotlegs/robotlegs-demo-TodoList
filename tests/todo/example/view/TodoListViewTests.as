package todo.example.view
{
	import flash.events.MouseEvent;
	
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.utils.proceedOnSignal;
	
	import todo.example.view.api.ITodoListView;

	public class TodoListViewTests extends ViewTests
	{
		[After]
		override public function after(): void
		{
			super.after();
		}
		
		/**
		 * Tests that the TodoListView implements ITodoListView.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(createView() as ITodoListView, notNullValue());
		}
		
		/**
		 * By default the createNewSignal shouldn't be null.
		 */
		[Test]
		public function default_createNewSignalIsNotNull(): void	
		{
			assertThat(createView().createNewSignal, notNullValue());
		}
		
		/**
		 * Tests that when the createNewButton is clicked then the createNewSignal
		 * should be dispatched.
		 */
		[Test(async)]
		public function clickCreateNewButton_DispatchesCreateNewSignal(): void
		{
			var todoListView: TodoListView = createView();
			proceedOnSignal(this, todoListView.createNewSignal);
			click(todoListView.createNewButton);
		}
		
		/**
		 * Disposing of the view should remove all the listeners on the 
		 * createNewSignal.
		 */
		[Test]
		public function dispose_RemovesListenersToCreateNewSignal(): void
		{
			var todoListView: TodoListView = createView();
			todoListView.createNewSignal.add(dummyMethod);
			todoListView.dispose();
			
			assertThat(todoListView.createNewSignal.numListeners, equalTo(0));
		}	
		
		/**
		 * Creates the test subject.
		 */
		private function createView(): TodoListView
		{
			var todoListView: TodoListView = new TodoListView();
			addToUI(todoListView);
			return todoListView;
		}
	}
}