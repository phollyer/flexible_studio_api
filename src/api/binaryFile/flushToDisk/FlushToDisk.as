package api.binaryFile.flushToDisk
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.flushToDisk.FlushToDiskEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.flushToDisk.FlushToDiskEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.flushToDisk.FlushToDiskEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_flushToDisk.html Northcode Help Documentation
	 */
	public class FlushToDisk extends BinaryFile
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.FlushToDisk()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_flushToDisk.html Northcode Help Documentation
		 */
		public function FlushToDisk(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_flushToDisk.html Northcode Help Documentation
		 */
		public function flushToDisk():void
		{
			ssCore.BinaryFile.flushToDisk( {} , {callback:actionComplete, errorSTR:"flushToDiskError", code:"11003"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var e : FlushToDiskEvent = new FlushToDiskEvent( FlushToDiskEvent.RESULT );
			dispatchEvent( e );
		}
	}
}