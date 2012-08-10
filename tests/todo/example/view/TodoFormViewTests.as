package todo.example.view
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.utils.proceedOnSignal;
	
	import todo.example.view.api.ITodoFormView;

	public class TodoFormViewTests extends ViewTests
	{
		[After]
		override public function after(): void
		{
			super.after();
		}
		
		/**
		 * Tests that the TodoFormView implements ITodoFormView.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(createView() as ITodoFormView, notNullValue());
		}
		
		/**
		 * By default the cancelSignal should not be null.
		 */
		[Test]
		public function default_cancelSignalIsntNull(): void
		{
			assertThat(createView().cancelSignal, notNullValue());
		}
		
		/**
		 * Tests that when the cancelButton is clicked the cancelSignal
		 * is dispatched.
		 */
		[Test(async)]
		public function clickCancelButton_DispatchesCancelSignal(): void
		{
			var todoFormView: TodoFormView = createView();
			proceedOnSignal(this, todoFormView.cancelSignal);
			
			click(todoFormView.cancelButton);
		}
		
		/**
		 * Creates the test subject.
		 */
		private function createView(): TodoFormView
		{
			var todoFormView: TodoFormView = new TodoFormView();
			addToUI(todoFormView);
			return todoFormView;
		}
	}
}