package todo.example
{
	import mx.events.FlexEvent;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.bender.framework.impl.Context;
	
	import spark.components.Application;
	
	import todo.example.todoForm.TodoFormConfig;
	import todo.example.todoList.TodoListConfig;
	
	public class TodoExampleApplication extends Application
	{
		protected var context: IContext;
		
		public function TodoExampleApplication()
		{
			super();
			
			setupContext();
		}
		
		/**
		 * Sets up the Robotlegs context.
		 */
		private function setupContext(): void
		{
			context = new Context()
				.install(MVCSBundle, SignalCommandMapExtension)
				.configure(AppConfig)
				.configure(TodoFormConfig)
				.configure(TodoListConfig)
				.configure(new ContextView(this));
			
			// If you wish to change the log level then uncomment the line below and set 
			// the logLevel to the value you desire. The default logLevel is DEBUG, which 
			// is set in the MVCSBundle. The default log level traces out the framework 
			// actions, which can assist in learning Robotlegs.
			//setLogLevel();
		}
		
		/**
		 * Sets the logLevel for the robotegs context.
		 */
		private function setLogLevel(): void
		{
			// setting the logLevel to WARN means that robotlegs
			// will also notify us about ERROR & FATAL.
			context.logLevel = LogLevel.WARN;
		}
	}
}