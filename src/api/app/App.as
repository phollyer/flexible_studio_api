package api.app
{
	import api.Kernel;
	
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class App extends Kernel
	{
		public function App(target:IEventDispatcher=null)
		{
			super(target);
		}		

		/**
		* This method should be called when a SWF Studio action
		* has completed successfully.
		*
		* <p>This method should be overridden by sub classes in
		* order to dispatch Class specific data</p>
		*
		* @param r The result Object returned by Kernel.
		*
		* @private
		*/
		override protected function sendResult(r:Object):void
		{
		}
		/**
		* This method should be called when a SWF Studio action
		* has completed successfully.
		*
		* <p>This method should be overridden by sub classes in
		* order to dispatch Class specific data</p>
		*
		* @param r The result Object returned by SWFStudio.
		*
		* @private
		*/
		override protected function sendResult(r:Object):void
		{
		}
	}
}