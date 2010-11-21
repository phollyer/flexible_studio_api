package api.binaryFile.getFilePointer
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.getFilePointer.GetFilePointerEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.binaryFile.getFilePointer.GetFilePointerEvent.RESULT
	*/
	[Event(name="result", type="api.events.binaryFile.getFilePointer.GetFilePointerEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_getFilePointer.html Northcode Help Documentation
	*/
	public class GetFilePointer extends BinaryFile
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var pointerIndex:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var systemError:String = null;
		
		/**
		* Constructor for BinaryFile.GetFilePointer()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_getFilePointer.html Northcode Help Documentation
		*/
		public function GetFilePointer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_getFilePointer.html Northcode Help Documentation
		*/
		public function getFilePointer():void
		{
			ssCore.BinaryFile.getFilePointer( {} , {callback:actionComplete, errorSTR:"getFilePointerError", code:"11004"} );
		}
		private function sendResults( r:Object ):void
		{
			pointerIndex = Number( r.result );
			var e : GetFilePointerEvent = new GetFilePointerEvent( GetFilePointerEvent.RESULT );
			e.systemError = systemError;
			e.pointerIndex = pointerIndex;
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
			var e : GetFilePointerEvent = new GetFilePointerEvent( GetFilePointerEvent.RESULT );
			dispatchEvent( e );
		}
	}
}