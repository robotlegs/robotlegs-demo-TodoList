package todo.example.view
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
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
		public function default_cancelSignalIsNotNull(): void
		{
			assertThat(createView().cancelSignal, notNullValue());
		}
		
		/**
		 * By default the saveSignal should not be null.
		 */
		[Test]
		public function default_saveSignalIsNotNull(): void
		{
			assertThat(createView().saveSignal, notNullValue());
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
		 * Disposing of the view should remove all the listeners on the 
		 * cancelSignal.
		 */
		[Test]
		public function dispose_RemovesListenersToCancelSignal(): void
		{
			var todoFormView: TodoFormView = createView();
			todoFormView.cancelSignal.add(dummyMethod);
			todoFormView.dispose();
			
			assertThat(todoFormView.cancelSignal.numListeners, equalTo(0));
		}	
		
		/**
		 * Tests that the taskDescription property returns the value that
		 * has been entered by the user in the text area.
		 */
		[Test]
		public function taskDescription_ReturnsValueEnteredByUser(): void
		{
			const expectedValue: String = "My dummy task.";
			var todoFormView: TodoFormView = createView();
			todoFormView.taskDescriptionTextArea.text = expectedValue;
			assertThat(todoFormView.taskDescription, equalTo(expectedValue));
		}
		
		/**
		 * Tests that setting a value on taskDescription sets the text of the
		 * taskDescriptionTextArea.
		 */
		[Test]
		public function taskDescription_SetValue_SetsTextAreaText(): void
		{
			const expectedValue: String = "My dummy task.";
			var todoFormView: TodoFormView = createView();
			todoFormView.taskDescription = expectedValue;
			assertThat(todoFormView.taskDescriptionTextArea.text, equalTo(expectedValue));
		}
		
		/**
		 * When the user clicks the saveButton the saveSignal should be
		 * dispatched to notify the application that the user wishes
		 * to save a task.
		 */
		[Test(async)]
		public function clickSaveButton_DispatchesTheSaveSignal(): void
		{
			var todoFormView: TodoFormView = createView();
			proceedOnSignal(this, todoFormView.saveSignal);
			click(todoFormView.saveButton);
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