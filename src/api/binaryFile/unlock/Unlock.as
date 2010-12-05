package api.binaryFile.unlock
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.unlock.UnlockEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.unlock.UnlockEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.unlock.UnlockEvent")]
	[Bindable]
	/**
	 * Release a previously obtained exclusive lock.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_unlock.html Northcode Help Documentation
	 */
	public class Unlock extends BinaryFile
	{
		// Results
		/**
		 * A system specific error code from the GetLastError function.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.Unlock()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_unlock.html Northcode Help Documentation
		 */
		public function Unlock(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Release a previously obtained exclusive lock.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_unlock.html Northcode Help Documentation
		 */
		public function unlock():void
		{
			ssCore.BinaryFile.unlock( {} , {callback:actionComplete, errorSTR:"unlockError", code:"11011"} );
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
			var e : UnlockEvent = new UnlockEvent( UnlockEvent.RESULT );
			dispatchEvent( e );
		}
	}
}