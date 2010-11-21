package api.activeX
{
	import api.Kernel;
	import flash.events.IEventDispatcher;
	
	/**
	 * The ActiveX Class provides the ability to Embed an
	 * ActiveX control inside your Application. You can interact
	 * with the ActiveX control using the Properties, Methods and
	 * Events of the ActiveX Control.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_Overview.html Help
	 */
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX.html Northcode Help Documentation
	*/
	public class ActiveX extends Kernel
	{
		/**
		* Constructor for ActiveX()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX.html Northcode Help Documentation
		*/
		public function ActiveX(target:IEventDispatcher=null)
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