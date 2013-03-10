package todo.example.todoList
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	
	import robotlegs.bender.framework.api.IConfig;

	public class TodoListConfigTests
	{
		/**
		 * Tests that the TodoListConfig class implements IConfig.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new TodoListConfig() as IConfig, notNullValue());
		}
	}
}