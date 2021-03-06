package api.wmAudio
{
	import api.Kernel;
	import flash.events.IEventDispatcher;

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio.html Northcode Help Documentation
	*/
	public class WmAudio extends Kernel
	{
		/**
		* Constructor for WmAudio()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio.html Northcode Help Documentation
		*/
		public function WmAudio(target:IEventDispatcher=null)
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