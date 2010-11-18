package api.scratch.write
{
	import flash.events.IEventDispatcher;
	import api.scratch.Scratch;
	
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Write extends Scratch
	{
		// Optional
		public var binary:Boolean = false;
		public var secure:Boolean = false;
		
		// Required
		public var data:String = null;
		
		public function Write(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function write( dataSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Scratch.write( {data:data , binary:binary , secure:secure}
										 ,{callback:actionComplete, errorSTR:"writeError", code:"34001"} );
			}
		}
	}
}