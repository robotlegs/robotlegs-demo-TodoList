package todo.example.view
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.utils.proceedOnSignal;
	
	import todo.example.view.api.ITodoListView;

	public class TodoListViewTests extends ViewTests
	{
		/**
		 * Tests that the TodoListView implements ITodoListView.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new TodoListView() as ITodoListView, notNullValue());
		}
		
		/**
		 * By default the createNewSignal shouldn't be null.
		 */
		[Test]
		public function default_createNewSignalIsNotNull(): void	
		{
			assertThat(new TodoListView().createNewSignal, notNullValue());
		}
		
		/**
		 * Tests that when the createNewButton is clicked then the createNewSignal
		 * should be dispatched.
		 */
		[Test(async)]
		public function clickCreateNewButton_DispatchesCreateNewSignal(): void
		{
			var todoListView: TodoListView = new TodoListView();
			addToUI(todoListView);

			proceedOnSignal(this, todoListView.createNewSignal);
			click(todoListView.createNewButton);
		}
	}
}