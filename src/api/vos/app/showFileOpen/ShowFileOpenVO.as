package api.vos.app.showFileOpen
{
	import api.vos.app.style.DialogListViewStyleVO;
	import api.vos.globals.Globals;
	[Bindable]
	public class ShowFileOpenVO
	{		
		public var caption:String = "Open File";
		public var filter:String = "All Files|*.*||";
		public var multipleSelect:Boolean = false;
		public var path:String = Globals.APPLICATION_START_DIR;
		public var style:String = DialogListViewStyleVO.DETAILS;
		
		public function ShowFileOpenVO()
		{
			super();
		}		
	}
}