package todo.example
{
	import mx.events.FlexEvent;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import spark.components.Application;
	
	import todo.example.config.AppConfiguration;
	
	public class TodoExampleApplication extends Application
	{
		protected var context: IContext;
		
		public function TodoExampleApplication()
		{
			super();
			
			addListeners();
		}
		
		/**
		 * Adds event listeners for the application.
		 */
		private function addListeners(): void
		{
			addEventListener(FlexEvent.PREINITIALIZE, preInitialize);
		}
		
		/**
		 * Handles the application preinitialization.
		 */
		protected function preInitialize(e: FlexEvent): void
		{
			context = new Context()
				.extend(MVCSBundle)
				.configure(AppConfiguration, this);
		}
	}
}