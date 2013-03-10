package todo.example.todoForm.view
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.notNullValue;
	import org.osflash.signals.utils.proceedOnSignal;
	
	import todo.example.todoForm.view.api.ITodoFormView;
	import todo.example.testing.ViewTests;

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
		 * By default the saveButton should not be enabled.
		 */
		[Test]
		public function default_saveButtonShouldBeDisabled(): void
		{
			assertThat(createView().saveButton.enabled, isFalse());
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
		 * When the user enters a task description, the saveButton should become enabled.
		 */
		[Test]
		public function enteringTaskDescription_WithText_EnablesSaveButton(): void
		{
			const expectedValue: String = "My dummy task.";
			var todoFormView: TodoFormView = createView();
			updateText(todoFormView.taskDescriptionTextArea, expectedValue);
			assertThat(todoFormView.saveButton.enabled, isTrue());		
		}
		
		/**
		 * Setting the taskDescription with a value that isn't an empty string, should
		 * enabled the save button.
		 */
		[Test]
		public function taskDescription_SetNonEmptyValue_EnablesSaveButton(): void
		{
			const nonEmptyValue: String = "My dummy task.";
			var todoFormView: TodoFormView = createView();
			todoFormView.taskDescription = nonEmptyValue;
			assertThat(todoFormView.saveButton.enabled, isTrue());		
		}
		
		/**
		 * Setting the taskDescription with a value that is an empty string, should
		 * disable the save button.
		 */
		[Test]
		public function taskDescription_SetEmptyValue_EnablesSaveButton(): void
		{
			const emptyValue: String = " ";
			var todoFormView: TodoFormView = createView();
			todoFormView.taskDescription = emptyValue;
			assertThat(todoFormView.saveButton.enabled, isFalse());		
		}
		
		/**
		 * Setting the taskDescription with a value that is anull , should
		 * disable the save button.
		 */
		[Test]
		public function taskDescription_SetNullValue_EnablesSaveButton(): void
		{
			var todoFormView: TodoFormView = createView();
			todoFormView.taskDescription = null;
			assertThat(todoFormView.saveButton.enabled, isFalse());		
		}
		
		/**
		 * When the user clicks the saveButton the saveSignal should be
		 * dispatched to notify the application that the user wishes
		 * to save a task.
		 */
		[Test(async)]
		public function clickSaveButton_WhenEnteredTaskDescription_DispatchesTheSaveSignal(): void
		{
			var todoFormView: TodoFormView = createView();
			todoFormView.taskDescription = "My dummy task";
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