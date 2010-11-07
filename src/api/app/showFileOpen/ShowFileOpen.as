package api.app.showFileOpen
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showFileOpen.ShowFileOpenEvent;
	import api.vos.app.showFileOpen.ShowFileOpenVO;
	
	[Event(name="missingFileOBJ" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.app.showFileOpen.ShowFileOpenEvent")]
	[Bindable]
	public class ShowFileOpen extends App
	{
		// Required
		public var fileOpenOBJ:ShowFileOpenVO = new ShowFileOpenVO();
		
		public function ShowFileOpen(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showFileOpen( showFileOpenVO:ShowFileOpenVO = null ):void
		{
			fileOpenOBJ = compare( showFileOpenVO , fileOpenOBJ );
			switch( fileOpenOBJ )
			{
				case null:
					missingFileOBJ();
					break;
				default:
					ssCore.App.showFileOpen( {caption:fileOpenOBJ.caption
											 ,path:fileOpenOBJ.path
											 ,filter:fileOpenOBJ.filter
											 ,multipleSelect:fileOpenOBJ.multipleSelect
											 ,style:fileOpenOBJ.style} , {callback:actionComplete, errorSTR:"showFileOpenError", code:"8001"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			var __fileList:Array = r.result.split( "\r" );
			
			var e : ShowFileOpenEvent = new ShowFileOpenEvent( ShowFileOpenEvent.RESULT );
			e.file = __fileList[ 0 ];
			e.fileList = __fileList;
			e.filterIndex = r.filterIndex;
			e.filterMask = r.filterMask;
			e.filterName = r.filterName;
			dispatchEvent( e );
		}
		private function compare( first:ShowFileOpenVO , second:ShowFileOpenVO ):ShowFileOpenVO
		{
			switch( first != null )
			{
				case true:
					second = first;
			}
			return second;
		}
	}
}