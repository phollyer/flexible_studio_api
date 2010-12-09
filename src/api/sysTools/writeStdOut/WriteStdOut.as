package api.sysTools.writeStdOut
{
	import api.events.sysTools.writeStdOut.WriteStdOutEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Write data to standard output.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_writeStdOut.html Northcode Help Documentation
	*/
	public class WriteStdOut extends SysTools
	{		
		// Required
		/**
		* Data to be written to standard output.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for SysTools.WriteStdOut()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_writeStdOut.html Northcode Help Documentation
		*/
		public function WriteStdOut(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Write data to standard output.
		*
		*
		* @param stdOutData
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_writeStdOut.html Northcode Help Documentation
		*/
		public function writeStdOut( stdOutData:String = null ):void
		{
			data = compareStrings( stdOutData , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.SysTools.writeStdOut( {data:data}
												,{callback:actionComplete, errorSTR:"writeStdOutError", code:"39008"} );
			}
		}
	}
}