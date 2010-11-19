package api.binaryFile.setFilePointer
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.setFilePointer.SetFilePointerEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.setFilePointer.SetFilePointerEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.setFilePointer.SetFilePointerEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_setFilePointer.html Northcode Help Documentation
	 */
	public class SetFilePointer extends BinaryFile
	{
		// Required
		public var pointerIndex:Number = -1;
		
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.SetFilePointer()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_setFilePointer.html Northcode Help Documentation
		 */
		public function SetFilePointer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param offset
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_setFilePointer.html Northcode Help Documentation
		 */
		public function setFilePointer( offset:Number = -1 ):void
		{
			pointerIndex = compareNumbers( offset , pointerIndex );
			switch( pointerIndex > 0 )
			{
				case true:
					setPointer();
					break;
				case false:
					invalidPointer();
			}
		}
		private function setPointer():void
		{
			ssCore.BinaryFile.setFilePointer( {offest:String( pointerIndex )} , {callback:actionComplete, errorSTR:"setFilePointerError", code:"11009"} );
		}
		private function invalidPointer():void
		{
			var e : SetFilePointerEvent = new SetFilePointerEvent( SetFilePointerEvent.INVALID_POINTER );
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
			var e : SetFilePointerEvent = new SetFilePointerEvent( SetFilePointerEvent.RESULT );
			dispatchEvent( e );
		}
	}
}