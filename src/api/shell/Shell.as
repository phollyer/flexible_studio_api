package api.shell
{
	import api.Kernel;
	import flash.events.IEventDispatcher;

	public class Shell extends Kernel
	{
		public function Shell(target:IEventDispatcher=null)
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
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult(r:Object):void
		{
		}
	}
}