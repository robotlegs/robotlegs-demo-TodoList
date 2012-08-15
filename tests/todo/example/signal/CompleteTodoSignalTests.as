package todo.example.signal
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class CompleteTodoSignalTests
	{
		/**
		 * CompleteTodoSignal should have Todo as an argument.
		 */
		[Test]
		public function default_ShouldHaveTodoAsArg(): void
		{
			assertThat(new CompleteTodoSignal().valueClasses.length, equalTo(1));
		}
	}
}