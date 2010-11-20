package api.http
{
	import flash.events.IEventDispatcher
	
	import api.Kernel;
	
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP.html Northcode Help Documentation
	*/
	public class Http extends Kernel
	{				
		public static var HOST:String = null;
		public static var RESOURCE:String = null;
		
		/**
		* Constructor for Http()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP.html Northcode Help Documentation
		*/
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