package api.binaryFile.getSize
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.getSize.GetSizeEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.binaryFile.getSize.GetSizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.binaryFile.getSize.GetSizeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_getSize.html Northcode Help Documentation
	*/
	public class GetSize extends BinaryFile
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var fileSize:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var systemError:String = null;
		
		/**
		* Constructor for BinaryFile.GetSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_getSize.html Northcode Help Documentation
		*/
		public function GetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_getSize.html Northcode Help Documentation
		*/
		public function getSize():void
		{
			ssCore.BinaryFile.getSize( {} , {callback:actionComplete, errorSTR:"getSizeError", code:"11005"} );
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
			fileSize = Number( r.result );
			var e : GetSizeEvent = new GetSizeEvent( GetSizeEvent.RESULT );
			e.fileSize = fileSize;
			e.systemError = systemError;
			dispatchEvent( e );
		}
	}
}