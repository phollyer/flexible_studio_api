package api.sysTools.writeStdOut
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class WriteStdOut extends SysTools
	{		
		// Required
		public var data:String = null;
		
		public function WriteStdOut(target:IEventDispatcher=null)
		{
			super(target);
		}
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