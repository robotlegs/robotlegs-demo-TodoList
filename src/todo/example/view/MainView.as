package todo.example.view
{
	import spark.components.Button;
	
	import todo.example.view.api.IMainView;
	import todo.example.view.ui.MainViewBase;
	
	public class MainView extends MainViewBase implements IMainView
	{
		public function get addButton(): Button
		{
			return addButtonUI;
		}
	}
}