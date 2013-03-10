package todo.example.todoForm
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	
	import robotlegs.bender.framework.api.IConfig;

	public class TodoFormConfigTests
	{
		/**
		 * Tests that the TodoFormConfig class implements IConfig.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new TodoFormConfig() as IConfig, notNullValue());
		}
	}
}