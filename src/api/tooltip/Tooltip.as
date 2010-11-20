package api.tooltip
{
	import api.Kernel;
	import flash.events.IEventDispatcher;

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip.html Northcode Help Documentation
	*/
	public class Tooltip extends Kernel
	{
		/**
		* Constructor for Tooltip()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip.html Northcode Help Documentation
		*/
		public function Tooltip(target:IEventDispatcher=null)
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