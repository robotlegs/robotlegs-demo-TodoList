package todo.example.view
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	
	import todo.example.view.api.IMainView;

	public class MainViewTests
	{
		/**
		 * Tests that the MainView implements IMainView.
		 */
		[Test]
		public function implements_expectedInterface(): void
		{
			assertThat(new MainView() as IMainView, notNullValue());
		}
	}
}