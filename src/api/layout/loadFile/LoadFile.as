package api.layout.loadFile
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.layout.loadFile.LoadFileEvent;
	import api.layout.Layout;
	
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.layout.loadFile.LoadFileEvent")]
	[Bindable]
	public class LoadFile extends Layout
	{		
		// Required
		public var resource:String = null;
		
		// Result
		public var data:String = null;
		
		public function LoadFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function loadFile( resourceSTR:String = null ):void
		{
			resource = compareStrings( resourceSTR , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.Layout.loadFile( {resource:resource}
										   ,{callback:actionComplete, errorSTR:"loadFileError", code:"26002"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result
			
			var e : LoadFileEvent = new LoadFileEvent( LoadFileEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}