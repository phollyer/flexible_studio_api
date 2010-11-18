package api.binaryFile.lock
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.lock.LockEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.lock.LockEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_lock.html Northcode Help Documentation
	 */
	public class Lock extends BinaryFile
	{
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.Lock()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_lock.html Northcode Help Documentation
		 */
		public function Lock(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_lock.html Northcode Help Documentation
		 */
		public function lock():void
		{
			ssCore.BinaryFile.lock( {} , {callback:actionComplete, errorSTR:"lockError", code:"11006"} );
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
			var e : LockEvent = new LockEvent( LockEvent.RESULT );
			dispatchEvent( e );
		}
	}
}