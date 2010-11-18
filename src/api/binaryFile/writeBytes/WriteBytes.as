package api.binaryFile.writeBytes
{
	import flash.events.IEventDispatcher;
	
	import api.binaryFile.BinaryFile;
	
	import api.events.binaryFile.writeBytes.WriteBytesEvent;
	import api.vos.binaryFile.FormatVO;
	
	/**
	 * Dispatched if the Property <code>data</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_DATA
	 */
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched if the Property <code>format</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_FORMAT
	 */
	[Event(name="missingFormat" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.binaryFile.writeBytes.WriteBytesEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.writeBytes.WriteBytesEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_writeBytes.html Northcode Help Documentation
	 */
	public class WriteBytes extends BinaryFile
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var data:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var format:String = null;
		
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		public var bytesWritten:Number = 0;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.WriteBytes()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_writeBytes.html Northcode Help Documentation
		 */
		public function WriteBytes(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param dataSTR
                 *
		 * @param formatSTR
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_writeBytes.html Northcode Help Documentation
		 */
		public function writeBytes( dataSTR:String = null , formatSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			format = compareStrings( formatSTR , format );
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					checkFormat();
			}
		}
		public function checkFormat():void
		{
			switch( format )
			{
				case null:
					missingFormat();
					break;
				case FormatVO.BYTE:
				case FormatVO.HEX:
				case FormatVO.UTF8:
					write();
					break;
				default:
					invalidFormat();
			}
		}
		private function write():void
		{
			ssCore.BinaryFile.writeBytes( {data:data , format:format} , {callback:actionComplete, errorSTR:"writeBytesError", code:"11012"} );
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
			bytesWritten = Number( r.bytesWritten );
			var e : WriteBytesEvent = new WriteBytesEvent( WriteBytesEvent.RESULT );
			e.bytesWritten = bytesWritten;
			e.systemError = systemError;
			dispatchEvent( e );
		}
		private function invalidFormat():void
		{
			var e : WriteBytesEvent = new WriteBytesEvent( WriteBytesEvent.RESULT_FORMAT );
			dispatchEvent( e );
		}

	}
}