package todo.example
{
	import todo.example.bundle.AppBundleTests;
	import todo.example.config.AppConfigurationTests;
	import todo.example.domain.TodoTests;
	import todo.example.model.ModelTests;
	import todo.example.view.MainViewTests;
	import todo.example.view.TodoListViewTests;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TodoExampleTestSuite
	{
		public var appBundleTests: AppBundleTests;
		public var appConfigurationTests: AppConfigurationTests;
		
		public var mainViewTests: MainViewTests;
		public var todoListViewTests: TodoListViewTests;
		
		public var modelTests: ModelTests;
		
		public var todoTests: TodoTests;
	}
}