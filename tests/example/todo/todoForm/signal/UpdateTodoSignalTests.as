package example.todo.todoForm.signal
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class UpdateTodoSignalTests
	{
		/**
		 * UpdateTodoSignal should have String as an argument.
		 */
		[Test]
		public function default_ShouldHaveStringAsArg(): void
		{
			assertThat(new UpdateTodoSignal().valueClasses.length, equalTo(1));
		}
	}
}