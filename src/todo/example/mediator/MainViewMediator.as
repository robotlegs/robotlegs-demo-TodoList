package todo.example.mediator
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import todo.example.model.api.IModel;
	import todo.example.view.api.IMainView;
	
	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var model: IModel;
		
		[Inject]
		public var view: IMainView;
		
		override public function initialize():void
		{
			
		}
		
		override public function destroy():void
		{
			
		}
	}
}