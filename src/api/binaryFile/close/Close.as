package api.binaryFile.close
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.close.CloseEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.close.CloseEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_close.html Northcode Help Documentation
	 */
	public class Close extends BinaryFile
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.Close()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_close.html Northcode Help Documentation
		 */
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_close.html Northcode Help Documentation
		 */
		public function close():void
		{
			ssCore.BinaryFile.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"11001"} );
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
			var e : CloseEvent = new CloseEvent( CloseEvent.RESULT );
			dispatchEvent( e );
		}
	}
}