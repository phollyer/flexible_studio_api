package api.http
{
	import flash.events.IEventDispatcher
	
	import api.Kernel;
	
	public class Http extends Kernel
	{				
		public static var HOST:String = null;
		public static var RESOURCE:String = null;
		
		public function Http(target:IEventDispatcher=null)
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