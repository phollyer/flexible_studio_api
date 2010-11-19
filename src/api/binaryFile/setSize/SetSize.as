package api.binaryFile.setSize
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.setSize.SetSizeEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.setSize.SetSizeEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.setSize.SetSizeEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_setSize.html Northcode Help Documentation
	 */
	public class SetSize extends BinaryFile
	{
		// Required
		public var bytes:Number = -1;
		
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.SetSize()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_setSize.html Northcode Help Documentation
		 */
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param bytesSize
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_setSize.html Northcode Help Documentation
		 */
		public function setSize( bytesSize:Number = -1 ):void
		{
			bytes = compareNumbers( bytesSize , bytes );
			switch( bytes > 0 )
			{
				case true:
					setBytesSize();
					break;
				case false:
					invalidSize();
			}
		}
		private function setBytesSize():void
		{
			ssCore.BinaryFile.setSize( {bytes:String( bytes )} , {callback:actionComplete, errorSTR:"setSizeError", code:"11010"} );
		}
		private function invalidSize():void
		{
			var e : SetSizeEvent = new SetSizeEvent( SetSizeEvent.RESULT_SIZE );
			dispatchEvent( e );
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
			var e : SetSizeEvent = new SetSizeEvent( SetSizeEvent.RESULT );
			dispatchEvent( e );
		}
	}
}