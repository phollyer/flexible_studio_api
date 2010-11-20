package api.layout.extractFile
{
	import flash.events.IEventDispatcher;
	import api.layout.Layout;

	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ExtractFile extends Layout
	{
		// Required
		public var destination:String = null;
		public var resource:String = null;
		
		public function ExtractFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function extractFile( resourceSTR:String = null , destinationSTR:String = null ):void
		{
			resource = compareStrings( resourceSTR , resource );
			destination = compareStrings( destinationSTR , destination );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					switch( destination )
					{
						case null:
							missingDestination();
							break;
						default:
							ssCore.Layout.extractFile( {destination:destination , resource:resource}
													  ,{callback:actionComplete, errorSTR:"extractFileError", code:"26000"} );
					}
			}
		}

	}
}